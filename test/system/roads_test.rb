require "application_system_test_case"

class RoadsTest < ApplicationSystemTestCase
  setup do
    @road = roads(:one)
  end

  test "visiting the index" do
    visit roads_url
    assert_selector "h1", text: "Roads"
  end

  test "creating a Road" do
    visit roads_url
    click_on "New Road"

    click_on "Create Road"

    assert_text "Road was successfully created"
    click_on "Back"
  end

  test "updating a Road" do
    visit roads_url
    click_on "Edit", match: :first

    click_on "Update Road"

    assert_text "Road was successfully updated"
    click_on "Back"
  end

  test "destroying a Road" do
    visit roads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Road was successfully destroyed"
  end
end
