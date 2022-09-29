require 'rails_helper'

RSpec.describe 'GET/Users', type: :request do
 describe 'GET users' do
   before(:example) { get users_path }  # get(:index)
   it "is a success" do
     expect(response).to have_http_status(:ok)
   end
   it "renders 'index' template" do
     expect(response).to render_template('index')
   end
    it "should include 'Here is a list of users'" do
      expect(response.body).to include('Here is a list of all users we have')
    end
 end
 describe 'GET /show' do
    before(:each) { get user_path id: 1 }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index page' do
      expect(response).to render_template(:show)
    end

    it "should include 'Show single user bio'" do
      expect(response.body).to include '"Here is the user`s bio"'
    end
  end
end