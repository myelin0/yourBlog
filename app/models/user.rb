class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  # validates :PostsCounter, numericality: { greater_than_or_equal_to: 0 }
  has_many :posts
  has_many :comments
  has_many :likes

  before_save :default_values

   def default_values
    if photo.nil?
      self.photo = 'https://img.myloview.com/posters/social-media-user-icon-default-avatar-profile-image-400-251200036.jpg'
    end
  end

  def recent_posts
    posts.last(3)
  end
end
