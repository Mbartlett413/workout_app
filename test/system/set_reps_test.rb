require "application_system_test_case"

class SetRepsTest < ApplicationSystemTestCase
  setup do
    @set_rep = set_reps(:one)
  end

  test "visiting the index" do
    visit set_reps_url
    assert_selector "h1", text: "Set Reps"
  end

  test "creating a Set rep" do
    visit set_reps_url
    click_on "New Set Rep"

    fill_in "Title", with: @set_rep.title
    click_on "Create Set rep"

    assert_text "Set rep was successfully created"
    click_on "Back"
  end

  test "updating a Set rep" do
    visit set_reps_url
    click_on "Edit", match: :first

    fill_in "Title", with: @set_rep.title
    click_on "Update Set rep"

    assert_text "Set rep was successfully updated"
    click_on "Back"
  end

  test "destroying a Set rep" do
    visit set_reps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Set rep was successfully destroyed"
  end
end
