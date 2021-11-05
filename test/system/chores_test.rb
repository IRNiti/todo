require "application_system_test_case"

class ChoresTest < ApplicationSystemTestCase
  
  test "viewing the index" do 
    visit chores_url
    assert_selector "h1", text: "These are your current chores"
  end

  test "creating a chore and editing" do
    visit chores_path
    click_on "New Chore"
    fill_in "Name", with: "Dishes"
    fill_in "Description", with: "We should do all the dishes!"
    click_on "Create Chore"
    assert_text "Dishes"

    chore = Chore.where(name: "Dishes")
    visit chore_path(chore.ids)
    click_on "Edit"
    fill_in "Name", with: "Test update"
    click_on "Update Chore"
    assert_text "Test update"
  end

end
