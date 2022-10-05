require 'rails_helper'
RSpec.feature 'User Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Emi',
                        photo: 'https://images.unsplash.com/photo-q=80', bio: 'Teacher from Albania.')
    @user2 = User.create(name: 'Negi',
                         photo: 'https://images.unsplash.com/photo-q=80', bio: 'Teacher from Egypt.')

    visit user_path(@user)
  end
  it ' displays the username for all users' do
    expect(page).to have_content('Emi')
  end

  it 'I can see the profile picture for each user' do
    expect(page.find(:css, '.user_page_image')[:src]).to have_content(@user.photo)
  end

  it 'should display the number of posts each user has written.' do
    expect(page).to have_content('Number of posts: 0')
  end

  it " When I click on a user it should redirected to that user's show page" do
    visit(user_path(@user.id))
    expect(page).to have_content('Bio')
  end
end