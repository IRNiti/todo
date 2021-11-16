require 'rails_helper'

RSpec.describe Chore, :type => :model do

  subject {
    described_class.new(
      name: 'Dishes',
      description: 'Do all the dishes'
    )
  }
  
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end
  
  it "is not valid without a name" do 
    subject.name = nil
    expect(subject).to_not be_valid 
  end

  it "is not valid without a description" do 
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a short description" do 
    subject.description = 'Do dishes'
    expect(subject).to_not be_valid
  end
end