# Defines named roles for users that may be applied to
# objects in a polymorphic fashion. For example, you could create a role
# "moderator" for an instance of a model (i.e., an object), a model class,
# or without any specification at all.
class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :authorizable, :polymorphic => true

  validates_uniqueness_of :name, :scope => [:authorizable_id, :authorizable_type]

  STATIC_ROLES = ["admin", "initial_reviewer", "final_reviewer", "author"]
  PUBLISHING_ROLES = ["admin", "final_reviewer"]
  DRAFT_VIEWING_ROLES = ["admin", "final_reviewer", "initial_reviewer", "author"]

  named_scope :root, :conditions => "authorizable_type IS NULL and authorizable_id IS NULL"

  def self.base_roles
    (root.find(:all).map(&:name) + STATIC_ROLES).uniq
  end
end
