class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_post_counter
  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_post_counter
    user.increment!(:PostsCounter)
  end
end
