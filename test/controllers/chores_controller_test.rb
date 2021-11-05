require "test_helper"

class ChoresControllerTest < ActionDispatch::IntegrationTest

  test "should get the index" do 
    get chores_path 
    assert_response :success
  end

  test "should create chore" do 
    assert_difference("Chore.count") do 
      post chores_path, params: { chore: { name: "Dishes", description: "We should do all the dishes!", done: false }}
    end

    assert_redirected_to chore_path(Chore.last)
  end

  test "should update chore" do 
    chore = chores(:one)
    put chore_url(chore), params: { chore: { name: "Updated name" }}
    assert_redirected_to chore_path(chore)
    chore.reload
    assert_equal "Updated name", chore.name
  end

end
