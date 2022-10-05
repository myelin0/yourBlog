require 'rails_helper'

def testgroup
  it 'should show the number of posts the user has written.' do
    expect(page).to have_content('Number of posts: 4')
  end

  it "it should show user's bio" do
    expect(page).to have_content('Bio')
  end

  it "should show user's first 3 posts." do
    expect(page).to have_content('Hello')
    expect(page).to have_content('Hello')
    expect(page).to have_content('Hello')
  end

  it "it should show  a button that lets me view all of a user's posts." do
    expect(page).to have_content('See all posts')
  end

  it " When I click a user's post, it redirects me to that post's show page." do
    visit(user_posts_path(@user.id))
    expect(page).to have_current_path user_posts_path(@user.id)
  end

  it "When I click to see all posts, it redirects me to the user's post's index page." do
    click_link 'See all posts'
    expect(page).to have_current_path user_path(@user)
  end
end
RSpec.feature 'User Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Emi',
                        photo: 'https://images.unsplash.com/photo-q=80', bio: 'Teacher from Albania.')
    @user2 = User.create(name: 'Negi',
                         photo: 'https://images.unsplash.com/photo-q=80', bio: 'Teacher from Egypt.')
    @first_post = Post.create(user: @user, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(user: @user, title: 'Hello', text: 'This is my first post')
    @third_post = Post.create(user: @user, title: 'Hello', text: 'This is my first post')
    @fourth_post = Post.create(user: @user, title: 'Hello', text: 'This is my first post')
    5.times do |_i|
      Comment.create(post: @first_post, user: @user2, text: 'Hi Emi!')
    end

    visit user_path(@user.id)
  end

  it "should  show user's profile picture" do
    expect(page.find(:css, '.user_page_image')[:src]).to have_content(@user.photo)
  end

  it "should show the user's username." do
    expect(page).to have_content('Emi')
  end

  testgroup
end