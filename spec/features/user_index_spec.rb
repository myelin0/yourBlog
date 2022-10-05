require 'rails_helper'
RSpec.feature 'User Index Page', type: :feature do
  before :each do
    @user_1 = User.create(name: 'Emi',
                        photo: 'https://images.unsplash.com/photo-q=80', bio: 'Teacher from Albania.', PostsCounter: 0)
    @user_2 = User.create(name: 'Negi',
                         photo: 'https://images.unsplash.com/photo-q=80', bio: 'Teacher from Egypt.', PostsCounter: 0)

    visit user_path(@user_1)
  end
  it ' displays the username for all users' do
    expect(page).to have_content('Emi')
  end

  it 'I can see the profile picture for each user' do
    expect(page.find(:css, '.user_page_image')[:src]).to have_content(@user_1.photo)
  end

  it 'should display the number of posts each user has written.' do
    expect(page).to have_content('Number of posts: 0')
  end

  it " When I click on a user it should redirected to that user's show page" do
    visit(user_path(@user_1.id))
    expect(page).to have_content('Bio')
  end
end