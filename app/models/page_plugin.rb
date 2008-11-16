class PagePlugin < ActiveRecord::Base
  acts_as_list :scope => :page_id

  belongs_to :page
  after_create :create_module

  def module
    if module_type and module_id
      module_class.find(module_id)
    end
  end

  def module_class
    module_type.constantize
  end

  def module_default_name
    "Module for Page Plugin ##{self.id}"
  end

  def create_module
    the_module = module_class.find_or_create_by_name(module_default_name)
    self.module_id = the_module.id
    self.save
  end

  def pretty_module_type
    module_type.to_s.split("::").last rescue nil
  end
end
