module CommentsHelper
  def show_comments_for(commentable)
    if commentable.settings["allow_comments"]
      render :partial => 'shared/comments', :locals => { :commentable => commentable }
    end
  end

  def show_comment_form_for(commentable, options={})
    raise "No return path specified" unless options[:return_path]
    if commentable.settings["allow_comments"]
      comment = Comment.new
      comment.commentable = commentable
      render :partial => 'shared/comment_form', :locals => { :comment => comment, :commentable => commentable, :return_path => options[:return_path] }
    end
  end

  def show_comment(comment)
    render :partial => 'shared/comment', :locals => { :comment => comment }
  end

  def show_comment_info_link_for(commentable, options={})
    raise "No path specified" unless options[:path]
    if commentable.settings["allow_comments"]
      render :partial => 'shared/comment_info_link', :locals => { :commentable => commentable, :path => options[:path] }
    end
  end
end
