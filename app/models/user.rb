# == Schema Information
# Schema version: 2
#
# Table name: users
#
#  id                        :integer(11)     not null, primary key
#  login                     :string(255)
#  email                     :string(255)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  created_at                :datetime
#  updated_at                :datetime
#  remember_token            :string(255)
#  remember_token_expires_at :datetime
#

require 'digest/sha1'
class User < ActiveRecord::Base
  include SavageBeast::UserInit
  include Ansuz::AclRoles
  attr_accessor :registering

  # acts_as_taggable_redux support
  acts_as_tagger # FIXME: We should switch to http://www.intridea.com/2007/12/4/announcing-acts_as_taggable_on

  # authorization plugin
  acts_as_authorized_user

  # userstamp plugin
  model_stamper
  stampable

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_confirmation_of :email,                      :if => :registering?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false

  before_save :encrypt_password

  named_scope :content_approvers, { :include => { :roles => {} }, :conditions => ["roles.name IN (?)", Role::CONTENT_APPROVER_ROLES] }
  named_scope :authors, { :include => { :roles => {} }, :conditions => ["roles.name IN (?)", Role::AUTHORING_ROLES] }

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def display_name
    login
  end

  # TODO: We should implement a rough version of this method
  def currently_online
    false
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    self.remember_token_expires_at = 2.weeks.from_now.utc
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  def to_s
    display_name
  end

  def can_publish?
    has_a_role_from? Role::PUBLISHING_ROLES
  end

  def can_view_drafts?
    has_a_role_from? Role::DRAFT_VIEWING_ROLES
  end

  def can_author_content?
    has_a_role_from? Role::AUTHORING_ROLES
  end

  def can_approve_content?
    has_a_role_from? Role::CONTENT_APPROVER_ROLES
  end

  def has_a_role_from? roles_array
    roles_array.detect{|r| has_role? r}
  end

protected
  # before filter 
  def encrypt_password
    return if password.blank?
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
    self.crypted_password = encrypt(password)
  end
  
  def password_required?
    crypted_password.blank? || !password.blank?
  end

  def registering?
    @registering
  end
end
