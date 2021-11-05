require "test_helper"

class ChoreTest < ActiveSupport::TestCase
  test "should not save chore without name" do 
    choreNoTitle = Chore.new(description: "We should do the dishes")
    assert_not choreNoTitle.save, "Saved chore without a name"
    choreWithTitle = Chore.new(name: "Dishes", description: "We should do the dishes")
    assert choreWithTitle.save, "Chore with name was not saved"
  end

  test "should not save chore with short description" do 
    choreNoDesc = Chore.new(name: "Dishes")
    assert_not choreNoDesc.save, "Saved chore with no description"
    choreShortDesc = Chore.new(name: "Dishes", description: "Do dishes")
    assert_not choreShortDesc.save, "Saved chore with description less than 10 char"
    chore = Chore.new(name: "Dishes", description: "Do all the dishes")
    assert chore.save, "Chore with appropriate description was not saved"
  end

end
