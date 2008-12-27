class ArticlesController < ApplicationController
  unloadable # This is required if you subclass a controller provided by the base rails app

  before_filter :load_blog_posts, :only => [:index]
  before_filter :load_blog_post,  :only => [:show]

  protected
  def load_blog_posts
    @blog_posts = Ansuz::JAdams::BlogPost.find(:all, :order => 'created_at DESC')
  end

  def load_blog_post
    @blog_post = Ansuz::JAdams::BlogPost.find_by_url(params[:id])
  end

  public
  def index
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
  end
end
