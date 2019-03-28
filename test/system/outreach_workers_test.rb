require "application_system_test_case"

class OutreachWorkersTest < ApplicationSystemTestCase
  setup do
    @outreach_worker = outreach_workers(:one)
  end

  test "visiting the index" do
    visit outreach_workers_url
    assert_selector "h1", text: "Outreach Workers"
  end

  test "creating a Outreach worker" do
    visit outreach_workers_url
    click_on "New Outreach Worker"

    fill_in "Organization", with: @outreach_worker.organization
    fill_in "User", with: @outreach_worker.user_id
    click_on "Create Outreach worker"

    assert_text "Outreach worker was successfully created"
    click_on "Back"
  end

  test "updating a Outreach worker" do
    visit outreach_workers_url
    click_on "Edit", match: :first

    fill_in "Organization", with: @outreach_worker.organization
    fill_in "User", with: @outreach_worker.user_id
    click_on "Update Outreach worker"

    assert_text "Outreach worker was successfully updated"
    click_on "Back"
  end

  test "destroying a Outreach worker" do
    visit outreach_workers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Outreach worker was successfully destroyed"
  end
end
