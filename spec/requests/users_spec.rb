require 'rails_helper'

RSpec.describe "Users", type: :request do
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
