require 'rails_helper'

RSpec.describe Chore, :type => :model do
  
  it "is valid with valid attributes" do 
    user = create(:user)
    chore = create(:chore, user_id: user.id)
    expect(chore).to be_valid
  end
  
  it "is not valid without a name" do 
    user = create(:user)
    chore = create(:chore, user_id: user.id)
    chore.name = nil
    expect(chore).to_not be_valid 
  end

  it "is not valid without a description" do 
    user = create(:user)
    chore = create(:chore, user_id: user.id)
    chore.description = nil
    expect(chore).to_not be_valid
  end

  it "is not valid with a short description" do 
    user = create(:user)
    chore = create(:chore, user_id: user.id)
    chore.description = 'Do dishes'
    expect(chore).to_not be_valid
  end
end