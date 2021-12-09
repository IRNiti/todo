require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET users" do 
    it "displays the user profile for a logged in user" do 
      user = create(:user)
      post login_path, params: { session: { email: "betty.rubble@gmail.com", password: "foobarzz" } }
      get user_path(user)
      expect(response.body).to include("betty.rubble@gmail.com")
    end

    it "does not display another user's profile even for a logged in user" do 
      user1 = create(:user)
      user2 = build(:user)
      user2.email = "test@test.com"
      user2.save
      post login_path, params: { session: { email: "betty.rubble@gmail.com", password: "foobarzz" } }
      get user_path(user2)
      expect(response.body).to include("You do not have access to this information.")
    end

    it "redirects to the login page when a non logged in user tries to view a user profile" do 
      user = create(:user)
      get user_path(user)
      assert_redirected_to login_path
    end
  end
  
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /new" do 
    it "creates a new user and redirects to the record page" do 
      post users_path, params: { 
                              user: {
                                name: "Betty", 
                                email: "betty.rubble@gmail.com", 
                                password: "12345678",
                                password_confirmation: "12345678"
                              } 
                            }
      expect(response).to redirect_to(user_path(User.last))
    end

    it "fails to create a user due to validation errors" do
      assert_no_difference 'User.count' do 
        post users_path, params: { 
                              user: {
                                name: "", 
                                email: "betty.rubble@gmail.com", 
                                password: "12345678",
                                password_confirmation: "12345678"
                              } 
                            }
      end
      expect(response.body).to include("Name can&#39;t be blank")
    end
  end

end
