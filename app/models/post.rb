class Post < ApplicationRecord
  self.per_page = 5
  belongs_to :user
  has_many :comments
  has_many :likes
  
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 },
                              allow_blank: true
  validates :LikesCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 },
                           allow_blank: true

  after_save :update_post_counter
  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def liked?(user)
    !!likes.find { |like| like.user_id == user.id }
  end
  # private

  def update_post_counter
    # user.increment!(:PostsCounter)
    user.update(PostsCounter: user.posts.count)
  end
end
