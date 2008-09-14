class Admin::TagsController < Admin::BaseController
  before_filter :load_tag,  :only => [:show]

  protected
  def load_tag
    @tag = Tag.find(params[:id])
  end

  public
  def index
  end

  def show
  end
end
