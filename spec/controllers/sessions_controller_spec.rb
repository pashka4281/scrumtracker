require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  render_views

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it 'should sign in user with valid credentials' do
      u = create :user, email: "mail@mail.com"
      post :create, email: "mail@mail.com", password: "password"
      expect(response).to redirect_to :root
    end

    it 'should render error for user with wrong email' do
      u = create :user, email: "mail@mail.com"
      post :create, email: "mail@mail.xdfs", password: "password"
      expect(response.body).to have_content("Email or password is wrong")
    end

    it 'should render error for user with wrong password' do
      u = create :user, email: "mail@mail.com"
      post :create, email: "mail@mail.com", password: "password_WRONG"
      expect(response.body).to have_content("Email or password is wrong")
    end
  end

end
