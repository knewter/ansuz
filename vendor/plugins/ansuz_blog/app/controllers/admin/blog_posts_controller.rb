class Admin::BlogPostsController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  layout 'admin'
  before_filter :load_blog_post,     :only => [:show, :edit, :update, :destroy]
  before_filter :load_new_blog_post, :only => [:new, :create]
  before_filter :load_blog_posts,    :only => [:index]

  protected
  def load_blog_post
    @blog_post = Ansuz::JAdams::BlogPost.find_by_url(params[:id])
  end

  def load_new_blog_post
    @blog_post = Ansuz::JAdams::BlogPost.new(params[:blog_post])
  end

  def load_blog_posts
    @blog_posts = Ansuz::JAdams::BlogPost.find(:all, :order => 'created_at DESC')
  end
  public
  def new
  end

  def create
    if @blog_post.save
      @blog_post.settings = params[:settings]
      @blog_post.save # has_settings doesn't work like you might want on new records yet, so we save twice.
      flash[:notice] = "Blog Post was created successfully."
      # Weak, baked-in support for quick-post plugin.
      if params[:quick_post]
        redirect_to admin_dashboard_path
      else
        redirect_to admin_blog_posts_path
      end
    else
      flash.now[:error] = "There was a problem creating the blog post."
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @blog_post.settings = params[:settings]
    if @blog_post.update_attributes(params[:blog_post])
      flash[:notice] = "Blog Post has been updated."
      redirect_to admin_blog_post_path(@blog_post)
    else
      flash.now[:error] = "There was a problem updating the Blog Post.  Please try again."
      render :action => 'edit'
    end
  end

  def destroy
    @blog_post.destroy
    flash[:notice] = "Blog post was deleted."
    redirect_to admin_blog_posts_path
  end
end
