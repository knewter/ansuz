# == Schema Information
# Schema version: 2
#
# Table name: pages
#
#  id            :integer(11)     not null, primary key
#  name          :string(255)
#  title         :string(255)
#  full_title    :string(255)
#  body          :text
#  created_at    :datetime
#  updated_at    :datetime
#  page_order    :integer(11)     default(0)
#  parent_id     :integer(11)
#  page_type     :string(255)     default("page")
#  display_title :boolean(1)      default(TRUE)
#  published     :boolean(1)      default(TRUE)
#  linked        :boolean(1)      default(TRUE)
#  show_sub_menu :boolean(1)
#

class Page < ActiveRecord::Base
  acts_as_tree   :order => 'page_order'
  before_save    :check_page_type, :check_page_order
  attr_protected :page_number, :pages 
  has_many       :page_plugins

  def linked_children
    children.select{|x| x.linked? }
  end

  def full_title
    full_title = read_attribute('full_title') 
    if full_title.nil? or full_title.size == 0
      read_attribute('title')
    else
      full_title
    end
  end

  # TODO: Convert to named_scope
  def self_and_siblings
    Page.find(:all, :conditions => ["parent_id = ?", self.parent_id], :order => 'page_order')
  end

  def swap!(direction)
    sibs = self.self_and_siblings
    return nil if sibs.length < 2 # Nothing to shift
		
    my_index = sibs.index(self)
    swap_index = my_index + direction
    return nil if (swap_index < 0) or (swap_index >= sibs.length) # Attempting to shift out of bounds

    sibling = sibs[swap_index]

    # Swap this page and its sibling's page_order
    Page.transaction do
      @disable_page_order_check = 1 # During swapping, do not check page_order integrity
      temp = self.page_order
      self.page_order = sibling.page_order
      sibling.page_order = temp
      self.save
      sibling.save
      @disable_page_order_check = nil
    end
    self.page_order
  end

  def publishable_children
    self.children.find :all, :conditions => ["published = ? AND linked = ?", true, true]
  end

  def ancestor_path
    path = self.ancestors.reverse
    path.delete_at 0
    return "/pages/" unless path.length > 0
    "/pages/" + path.collect(&:name).join('/') + "/"
  end

  # Returns page_body from cache
  # defaults to the current page_number
  def page_body(page = self.page_number)
    return self.body if self.page_type == 'page'
    return nil unless page > 0
    @split_pages[page-1]
  end

  # split_page! splits the page and does different boundary checks.
  # 
  # Boundary checks:
  #
  # page/ should default to first page
  # page/1 should return first page
  # page/0 should return nil (out of bound)
  # page/n where n > pages should return nil (out of bound)
  #
  # TODO: Possible bug:
  #  - @split_pages is cached, so if you change the body again and then call
  #    split_page!, the code looks like it will ignore the cache
  def split_page!(page_number = 1)
    if self.page_type == 'page'
      self[:page_body] = self.body
      self[:page_number] = 1
      self[:pages] = 1
      return self
    end
		
    @split_pages ||= self.body.split(/\{pagebreak\}/i)
    self[:pages] = pages = @split_pages.length
    self[:page_number] = page_number
    return self
  end

  def find_child(child_name)
    self.children.find(:first, :conditions => ["name = ? and published = true", child_name ])
  end
	 
  # Accepts params[:path] and returns the page object or nil
  def self.find_page_by_path(path)
    #logger.error("==> find_page_by_path: path = [ #{path.join("/")} ]")
    page = Page.root
    return nil if Page.root.nil?

    # Not DRY. This piece of code handles multipage root
    return page.split_page! if path.length < 1 or page.name == path[0]

    path.each_with_index do |node, i|
      # Handles page/1 by detecting the page number as the last in the path
      return page.split_page!(node.to_i) if page.page_type == 'multipage' and path[i] == path.last and node.to_i > 0
      return nil if (page = page.find_child(node)).nil?
    end
    
    page.split_page!
  end

  # Get the last page in the tree
  def last_page
    parent_id = self.parent_id.to_s
    result = ActiveRecord::Base.connection().select_one "SELECT MAX(page_order) AS last_page_order FROM pages WHERE parent_id = #{parent_id};" 
    result['last_page_order'].to_i
  end

  def to_s
    name
  end

  protected
  def check_page_type
    self.page_type = "page" and return if self.body.blank? || (@split_pages = self.body.split(/\{pagebreak\}/i)).length == 1 
    self.page_type = "multipage"
  end

  def check_page_order
    return true if @disable_page_order_check
    # If this is a new record, id is nil. Interpolated, this would create an SQL query
    # with AND id != NULL which will return an empty set.
    conditions = ["parent_id = ? AND page_order = ? ", self.parent_id, self.page_order]
    if self.id
      conditions[0] += "AND id != ?"
      conditions << self.id
    end
    duplicate = Page.find(:first, :conditions => conditions)
    return true if duplicate.nil?
    self.page_order = self.last_page + 1
  end

end
