require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  # describe "GET /new" do
  #   it "returns http success" do
  #     get "/sessions/new"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST /login" do 
    it "fails login with invalid credentials" do
      get login_path
      post login_path, params: { session: { email: "", password: "" } }
      assert_not flash.empty?
      get root_path
      assert flash.empty?
    end
  end

end
