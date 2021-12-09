require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /login" do 
    it "fails login with invalid credentials" do
      post login_path, params: { session: { email: "", password: "12345678" } }
      assert_not flash.empty?
      expect(response.body).to include("Invalid email/password combination")
      get root_path
      assert flash.empty?
    end

    it "logs in user with valid credentials and updates nav bar" do 
      user = create(:user)
      get login_path
      expect(response.body).to include("Log in")
      expect(response.body).to_not include("Log out")
      post login_path, params: { session: { email: "betty.rubble@gmail.com", password: "foobarzz" } }
      assert flash.empty?
      assert_redirected_to user
      get root_path
      expect(response.body).to_not include("Log in")
      expect(response.body).to include("Log out")
    end
  end

  describe "DELETE /logout" do 
    it "logs out user and updates nav bar" do 
      user = create(:user)
      get login_path
      expect(response.body).to include("Log in")
      expect(response.body).to_not include("Log out")
      post login_path, params: { session: { email: "betty.rubble@gmail.com", password: "foobarzz" } }
      assert flash.empty?
      assert_redirected_to user
      get root_path
      expect(response.body).to_not include("Log in")
      expect(response.body).to include("Log out")
      delete logout_path
      assert_redirected_to root_path
      get root_path
      expect(response.body).to include("Log in")
      expect(response.body).to_not include("Log out")
    end
  end

end
