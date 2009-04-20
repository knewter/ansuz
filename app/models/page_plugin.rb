# == Schema Information
# Schema version: 20090125222830
#
# Table name: page_plugins
#
#  id          :integer(4)      not null, primary key
#  page_id     :integer(4)
#  module_type :string(255)
#  module_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  position    :integer(4)
#

class PagePlugin < ActiveRecord::Base
  acts_as_list :scope => :page_id

  belongs_to :page
  after_create :create_module

  def module
    if module_type and module_id
      module_class.find(module_id)
    end
  end

  def module_xml
    self.module.to_xml(:skip_instruct => true)
  end

  def module_class
    Object.path2class(module_type)
  end

  def module_default_name
    "Module for Page Plugin ##{self.id}"
  end

  def create_module
    the_module = module_class.find_or_create_by_name(module_default_name)
    the_module.save
    self.module_id = the_module.id
    self.save
  end

  def pretty_module_type
    module_type.to_s.split("::").last rescue nil
  end
end
