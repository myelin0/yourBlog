class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter

  private

  def update_comment_counter
    user.increment!(:CommentsCounter)
  end
end
