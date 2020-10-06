require "application_system_test_case"

class MaxEffortsTest < ApplicationSystemTestCase
  setup do
    @max_effort = max_efforts(:one)
  end

  test "visiting the index" do
    visit max_efforts_url
    assert_selector "h1", text: "Max Efforts"
  end

  test "creating a Max effort" do
    visit max_efforts_url
    click_on "New Max Effort"

    fill_in "Exercise", with: @max_effort.exercise_id
    fill_in "Max amount", with: @max_effort.max_amount
    fill_in "User", with: @max_effort.user_id
    click_on "Create Max effort"

    assert_text "Max effort was successfully created"
    click_on "Back"
  end

  test "updating a Max effort" do
    visit max_efforts_url
    click_on "Edit", match: :first

    fill_in "Exercise", with: @max_effort.exercise_id
    fill_in "Max amount", with: @max_effort.max_amount
    fill_in "User", with: @max_effort.user_id
    click_on "Update Max effort"

    assert_text "Max effort was successfully updated"
    click_on "Back"
  end

  test "destroying a Max effort" do
    visit max_efforts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Max effort was successfully destroyed"
  end
end
