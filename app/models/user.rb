class User < ApplicationRecord
  validates :name, presence: true
  validates :PostsCounter, numericality: { greater_than_or_equal_to: 0 }
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts
    posts.last(3)
  end
end
