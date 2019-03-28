require "application_system_test_case"

class ReEntrantsTest < ApplicationSystemTestCase
  setup do
    @re_entrant = re_entrants(:one)
  end

  test "visiting the index" do
    visit re_entrants_url
    assert_selector "h1", text: "Re Entrants"
  end

  test "creating a Re entrant" do
    visit re_entrants_url
    click_on "New Re Entrant"

    fill_in "Neighborhood", with: @re_entrant.neighborhood
    fill_in "User", with: @re_entrant.user_id
    click_on "Create Re entrant"

    assert_text "Re entrant was successfully created"
    click_on "Back"
  end

  test "updating a Re entrant" do
    visit re_entrants_url
    click_on "Edit", match: :first

    fill_in "Neighborhood", with: @re_entrant.neighborhood
    fill_in "User", with: @re_entrant.user_id
    click_on "Update Re entrant"

    assert_text "Re entrant was successfully updated"
    click_on "Back"
  end

  test "destroying a Re entrant" do
    visit re_entrants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Re entrant was successfully destroyed"
  end
end
