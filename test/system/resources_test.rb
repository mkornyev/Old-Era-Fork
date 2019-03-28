require "application_system_test_case"

class ResourcesTest < ApplicationSystemTestCase
  setup do
    @resource = resources(:one)
  end

  test "visiting the index" do
    visit resources_url
    assert_selector "h1", text: "Resources"
  end

  test "creating a Resource" do
    visit resources_url
    click_on "New Resource"

    fill_in "Address", with: @resource.address
    fill_in "Desc", with: @resource.desc
    fill_in "Email", with: @resource.email
    fill_in "Enddate", with: @resource.endDate
    fill_in "Image", with: @resource.image
    fill_in "Name", with: @resource.name
    fill_in "Phone", with: @resource.phone
    fill_in "Startdate", with: @resource.startDate
    fill_in "Webpage", with: @resource.webpage
    click_on "Create Resource"

    assert_text "Resource was successfully created"
    click_on "Back"
  end

  test "updating a Resource" do
    visit resources_url
    click_on "Edit", match: :first

    fill_in "Address", with: @resource.address
    fill_in "Desc", with: @resource.desc
    fill_in "Email", with: @resource.email
    fill_in "Enddate", with: @resource.endDate
    fill_in "Image", with: @resource.image
    fill_in "Name", with: @resource.name
    fill_in "Phone", with: @resource.phone
    fill_in "Startdate", with: @resource.startDate
    fill_in "Webpage", with: @resource.webpage
    click_on "Update Resource"

    assert_text "Resource was successfully updated"
    click_on "Back"
  end

  test "destroying a Resource" do
    visit resources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resource was successfully destroyed"
  end
end
