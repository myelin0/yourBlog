class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true, uniqueness: { scope: :post_id }
  validates :post_id, presence: true
  
  after_save :update_like_counter

  # private

  def update_like_counter
    post.update(LikesCounter: post.likes.count)
  end
end
