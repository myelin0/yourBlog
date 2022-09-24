require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       PostsCounter: 1)
    post = Post.create(title: 'Hello', text: 'This is my first post', CommentsCounter: 0, LikesCounter: 0,
                       user_id: user.id)
    Like.create(post_id: post.id, user_id: user.id)
    Like.new(post_id: post.id, user_id: user.id)
  end

  before { subject.save }

  it 'should save the like' do
    expect(subject).to be_valid
  end

  it 'should update posts like counter' do
    expect(subject.post.LikesCounter).to eq 2
  end
end
