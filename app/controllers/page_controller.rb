class PageController < ApplicationController
  # indexer
  # http://domain.com/* -> maps to the tree structure stored in db
  # Currently in need of some serious refactoring
  def indexer
    handle_xml
    logger.info params['path'].inspect
    @page = Page.visible.find_page_by_path params['path']
    @breadcrumb = @page.ancestors.reverse.collect { |x| [x.full_path, x.title] } if @page
    @top_page = params[:path][0] || 'root'
    render :template => "404", :status => 404, :layout => false and return unless @page
    respond_to do |format|
      format.html do
        if @page.is_published? || (logged_in? && current_user.can_view_drafts?)
          render :template => 'content/page' and return if @page.page_type == "page"
        else
          render :template => 'content/unpublished' and return if @page.page_type == "page"
        end
        render :template => 'content/multipage' # FIXME: we seem to never, ever hit this anyway
      end
      format.xml do
        @page.page_plugins
        render :xml => @page.to_xml
      end
    end
  end

  protected
  # FIXME: This is awful, awful, but due to our route for pages, necessary at present
  def handle_xml
    if params['path'].is_a?(Array)
      if params['path'].last =~ /\.xml/
        request.format = :xml
        params['path'].last.gsub!(/\.xml/, '')
      end
    end
  end
end
