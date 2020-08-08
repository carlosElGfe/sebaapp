require "application_system_test_case"

class CookiesTest < ApplicationSystemTestCase
  setup do
    @cooky = cookies(:one)
  end

  test "visiting the index" do
    visit cookies_url
    assert_selector "h1", text: "Cookies"
  end

  test "creating a Cookie" do
    visit cookies_url
    click_on "New Cookie"

    click_on "Create Cookie"

    assert_text "Cookie was successfully created"
    click_on "Back"
  end

  test "updating a Cookie" do
    visit cookies_url
    click_on "Edit", match: :first

    click_on "Update Cookie"

    assert_text "Cookie was successfully updated"
    click_on "Back"
  end

  test "destroying a Cookie" do
    visit cookies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cookie was successfully destroyed"
  end
end
