# == Schema Information
# Schema version: 20090125222830
#
# Table name: comments
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  email            :string(255)
#  website          :string(255)
#  comments         :text
#  commentable_type :string(255)
#  commentable_id   :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

# This was copied from the acts_as_commentable plugin, and I'm changing it a bit - JA
class Comment < ActiveRecord::Base
  validates_presence_of :commentable_type, :commentable_id, :comments

  belongs_to :commentable, :polymorphic => true

  # NOTE: Comments belong to a user
  belongs_to :user
  
  # NOTE: install the acts_as_votable plugin if you 
  # want user to vote on the quality of comments.
  #acts_as_voteable

  named_scope :recent, :limit => 5, :order => "created_at DESC"
  named_scope :for, lambda{ |klass| { :conditions => ["commentable_type = ?", klass] } }
  
  # Helper class method to look up all comments for 
  # commentable class name and commentable id.
  def self.find_comments_for_commentable(commentable_str, commentable_id)
    find(:all,
      :conditions => ["commentable_type = ? and commentable_id = ?", commentable_str, commentable_id],
      :order => "created_at DESC"
    )
  end

  # Helper class method to look up a commentable object
  # given the commentable class name and id 
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end
end
