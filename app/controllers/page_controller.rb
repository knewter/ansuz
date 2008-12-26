class PageController < ApplicationController
  # indexer
  # http://domain.com/* -> maps to the tree structure stored in db
  # Currently in need of some serious refactoring
  def indexer
    @page = Page.visible.find_page_by_path params['path']
    @breadcrumb = @page.ancestors.reverse.to_a if @page
    @top_page = params[:path][0] || 'root'
    render :template => "404", :status => 404, :layout => false and return unless @page
    if @page.is_published? || (logged_in? && current_user.can_view_drafts?)
      render :template => 'content/page' and return if @page.page_type == "page"
    else
      render :template => 'content/unpublished' and return if @page.page_type == "page"
    end
    render :template => 'content/multipage'
  end
end
