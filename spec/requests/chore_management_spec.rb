require "rails_helper"

RSpec.describe "Chore management", :type => :request do

  it "returns generic home page if user is not logged in" do
    get chores_path 
    expect(response.body).to include("Welcome to the Todo App")
  end

  it "returns all chores at index for logged in user" do 
    user = create(:user)
    post login_path, params: { session: { email: "betty.rubble@gmail.com", password: "foobarzz" } }
    get chores_path 
    expect(response.body).to include("Chores Done")
    expect(response.body).to include("Chores In Progress")
  end

  it "creates a Chore and redirects to the Chores's page" do
    user = create(:user)
    post chores_path, params: { 
                        chore: {
                          name: "Dishes", 
                          description: "Do all the dishes", 
                          done: false,
                          user_id: user.id
                        } 
                      }
    expect(response).to redirect_to(chore_path(Chore.last))
  end

  it "fails to create a Chore due to validation errors" do 
    post chores_path, params: { chore: {name: "Dishes", description: "Do dishes", done: false} }
    expect(response.body).to include("Description is too short")
  end

  it "updates a Chore and redirects to the Chore's page" do 
    user = create(:user)
    create(:chore, user_id: user.id)
    put chore_path(Chore.last), params: { chore: { name: "Updated name" }}
    expect(response).to redirect_to(chore_path(Chore.last))
    get chore_path(Chore.last)
    expect(response.body).to include("Updated name")
  end

  it "updates a Chore and fails due to validation errors" do 
    user = create(:user)
    create(:chore, user_id: user.id)
    put chore_path(Chore.last), params: { chore: { description: "short" }}
    expect(response.body).to include("Description is too short")
  end

  it "deletes an existing Chore and redirects to index" do 
    user = create(:user)
    create(:chore, user_id: user.id)
    delete chore_url(Chore.last)
    expect(response).to redirect_to(root_path)
  end

end