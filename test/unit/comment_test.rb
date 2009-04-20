require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should_validate_presence_of :commentable_type, :commentable_id, :comments

  context "The Comment class" do
    setup do
      @comment = Factory(:comment)
    end

    context "sent find_comments_for_commentable" do
      setup do
        @comments = Comment.find_comments_for_commentable(@comment.commentable_type, @comment.commentable_id)
      end

      should "find one comment" do
        assert_equal 1, @comments.length
      end
    end

    context "sent find_commentable" do
      setup do
        @commentable = Comment.find_commentable(@comment.commentable_type, @comment.commentable_id)
      end

      should "find the associated object" do
        assert_equal @comment.commentable, @commentable
      end
    end
  end
end
