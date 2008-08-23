class Message < ActiveRecord::Base
  # This will eventually be moved into config/contact_groups.yml
  # To configure these groups, make sure to add data in both variables
  CONTACT_GROUP = YAML::load_file("#{RAILS_ROOT}/config/contact_groups.yml").freeze

  CONTACT_GROUP_OPTIONS = Hash.new
  CONTACT_GROUP.each { |k,v| CONTACT_GROUP_OPTIONS[k] = v['name'] }
  CONTACT_GROUP_OPTIONS.freeze

  # TODO: Refactor below to be pulled from CONTACT_GROUP
  #CONTACT_GROUP_EMAILS = {
  #  'executive' => %w{ test1@test.org test2@test.org },
  #}.freeze

# Do not edit below this line
  validates_presence_of :name, :contact_whom, :message
  validates_length_of :name, :maximum => 255
  validates_length_of :email, :maximum => 255
  validates_length_of :phone, :maximum => 255
  validates_length_of :message, :maximum => 65000 # DB limit might be different

  # Gets list of emails to send out based on the contact group
  def contact_emails 
    CONTACT_GROUP[read_attribute('contact_whom')]['emails']
  end

  # Gets the full name of the contact group
  def contact_group_name
    CONTACT_GROUP[read_attribute('contact_whom')]['name']
  end

  def self.contact_whom
    CONTACT_GROUP_OPTIONS.invert.sort
  end

end
