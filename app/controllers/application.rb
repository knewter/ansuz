class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  def set_layout_variables
    @root = Page.root
    @topNav = @root.publishable_children
    @topNavChildren = Hash.new
    @topNav.each do |sub|
      temp = sub.publishable_children
      @topNavChildren[sub] = temp if temp.length > 0
    end
    @topNav.unshift @root
    @breadcrumb = @page.ancestors.reverse.to_a if @page
  end
end
