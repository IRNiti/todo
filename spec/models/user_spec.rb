require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid with valid attributes" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "is not valid without a name" do 
    user = create(:user)
    user.name = nil
    expect(user).to_not be_valid 
  end

  it "is not valid without an email" do 
    user = create(:user)
    user.email = nil
    expect(user).to_not be_valid 
  end

  it "is not valid with an invalid email" do 
    user = create(:user)
    user.email = 'betty'
    expect(user).to_not be_valid 
  end

  it "is not valid if the email already exists" do 
    user1 = create(:user)
    user2 = build(:user)
    user2.email = user1.email.upcase
    expect(user2).to_not be_valid
    expect { user2.save validate: false }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it "is not valid with a blank password" do 
    user = create(:user)
    user.password = user.password_confirmation = " " * 8
    expect(user).to_not be_valid
  end

  it "is not valid with a short password" do 
    user = create(:user)
    user.password = user.password_confirmation = "a" * 7
    expect(user).to_not be_valid
  end

end
