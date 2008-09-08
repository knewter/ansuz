class ForumsController < ApplicationController
  layout 'forum'
  before_filter :set_page_title

protected
  def set_page_title
    @page_title = "Ansuz - Forum"
  end
end
