# == Schema Information
# Schema version: 20090125222830
#
# Table name: pages
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  title         :string(255)
#  full_title    :string(255)
#  status        :string(255)
#  body          :text
#  created_at    :datetime
#  updated_at    :datetime
#  page_order    :integer(4)      default(0)
#  parent_id     :integer(4)
#  page_type     :string(255)     default("page")
#  display_title :boolean(1)      default(TRUE)
#  published     :boolean(1)      default(TRUE)
#  linked        :boolean(1)      default(TRUE)
#  show_sub_menu :boolean(1)
#  publish_at    :datetime
#  expires_on    :datetime
#

class Page < ActiveRecord::Base
  include AASM
  include ActionView::Helpers::DateHelper
  acts_as_commentable
  has_settings

  validates_presence_of :name, :title

  named_scope :visible, :conditions => ["(expires_on > ? OR expires_on IS NULL) AND published = ? AND (publish_at <= ? OR publish_at IS NULL )", Time.now.getgm, true, Time.now.getgm]
  named_scope :self_and_siblings, lambda {|page| {:conditions => ["parent_id = ?", page.parent_id], :order => 'page_order'}}
  named_scope :expired,      lambda {|p| { :conditions => ["expires_on < ?", Time.now.getgm] } }
  named_scope :expires_soon, lambda {|p| { :conditions => ["expires_on < ?", Time.now.getgm + 5.days ] } }

  aasm_column :status
  aasm_initial_state :draft
  aasm_state :reviewing, :enter => :inform_reviewers
  aasm_state :published, :enter => :inform_authors
  aasm_state :draft
  
  aasm_event :submit_for_review do
    transitions :to => :reviewing, :from => [:draft, :reviewing]
  end

  aasm_event :publish do
    transitions :to => :published, :from => [:reviewing, :draft, :published]
  end

  acts_as_tree   :order => 'page_order'
  attr_protected :page_number, :pages 

  has_many       :page_plugins, :order => 'position ASC'
  has_one        :page_metadata

  before_save    :check_page_type, :check_page_order
  before_save    :ensure_page_metadata

  # authorization plugin
  acts_as_authorizable

  protected
  def inform_reviewers
    if User.content_approvers.any?
      AnsuzMailer.deliver_page_review_notifications(self)
    end
  end

  def inform_authors
    if User.authors.any?
      AnsuzMailer.deliver_page_publication_notifications(self)
    end
  end

  public
  def status_text
    if( self.publish_at && self.publish_at > Time.now )
      text = self.status + ", visible in #{distance_of_time_in_words( Time.now, (self.publish_at))} "
    else
      self.status
    end
  end

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

  def self_and_siblings
    Page.self_and_siblings self
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
    self.children.find :all, :conditions => ["status=? AND linked = ?", 'published', true]
  end

  def path
    ancestor_pages + [self]
  end

  def ancestor_pages
    the_ancestors = self.ancestors.reverse
    the_ancestors.delete_at 0
    the_ancestors
  end

  def ancestor_path
    path = ancestor_pages
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
    self.children.find(:first, :conditions => ["name = ? and published = ?", child_name, true ])
  end
	 
  # Accepts params[:path] and returns the page object or nil
  def self.find_page_by_path(path)
    #logger.error("==> find_page_by_path: path = [ #{path.join("/")} ]")
    page = Page.root
    return nil if page.nil?

    # Not DRY. This piece of code handles multipage root
    return page.split_page! if path.length < 1 or page.name == path[0]

    path.each_with_index do |node, i|
      # Handles page/1 by detecting the page number as the last in the path
      return page.split_page!(node.to_i) if page.page_type == 'multipage' and path[i] == path.last and node.to_i > 0
      return nil if (page = page.find_child(node)).nil?
    end
    
    page.split_page!
  end

  def self.find_or_create_page_by_path(path)
    ary = path.split('/')
    page = find_page_by_path(ary)
    return page if page
    # if it doesn't exist, create the path that it's supposed to exist at
    page = nil
    paths = []
    ary.each_with_index do |entry, i|
      paths << ary[0..i]
    end
    paths.each_with_index do |the_path, i|
      # get the parent
      unless i == 0
        parent = find_page_by_path(paths[i-1])
      end
      # create it if it doesn't exist
      unless page = find_page_by_path(the_path)
        name = the_path.last
        page = Page.new(:name => name, :title => name, :full_title => name, :parent_id => (parent ? parent.id : Page.root.id))
        page.save
      end
    end
    page
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

  def is_published?
    status == 'published'
  end

  def is_draft?
    status == 'draft'
  end

  def permalinkable_title
    title.downcase.gsub(/ /, '-')
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

  def ensure_page_metadata
    unless self.page_metadata
      self.page_metadata = PageMetadata.new
    end
  end

end
