module CommentsHelper
  def show_comments_for(commentable)
    render :partial => 'shared/comments', :locals => { :commentable => commentable }
  end

  def show_comment_form_for(commentable, options={})
    raise "No return path specified" unless options[:return_path]
    comment = Comment.new
    comment.commentable = commentable
    render :partial => 'shared/comment_form', :locals => { :comment => comment, :commentable => commentable, :return_path => options[:return_path] }
  end

  def show_comment(comment)
    render :partial => 'shared/comment', :locals => { :comment => comment }
  end

  def show_comment_info_link_for(commentable, options={})
    rause "No path specified" unless options[:path]
    render :partial => 'shared/comment_info_link', :locals => { :commentable => commentable, :path => options[:path] }
  end
end
