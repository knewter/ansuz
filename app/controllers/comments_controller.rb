class CommentsController < ApplicationController
  before_filter :load_new_comment, :only => [:create]

  protected
  def load_new_comment
    @comment = Comment.new(params[:comment])
  end

  public
  def create
    if @comment.save
      flash[:notice] = "Comment was submitted successfully."
    else
      flash[:error] = "There was a problem with your comment."
    end
    redirect_to params[:return_path]
  end
end
