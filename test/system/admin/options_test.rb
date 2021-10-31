require "application_system_test_case"

class Admin::OptionsTest < ApplicationSystemTestCase
  setup do
    @admin_option = admin_options(:one)
  end

  test "visiting the index" do
    visit admin_options_url
    assert_selector "h1", text: "Admin/Options"
  end

  test "creating a Option" do
    visit admin_options_url
    click_on "New Admin/Option"

    fill_in "Name", with: @admin_option.name
    fill_in "Slug", with: @admin_option.slug
    click_on "Create Option"

    assert_text "Option was successfully created"
    click_on "Back"
  end

  test "updating a Option" do
    visit admin_options_url
    click_on "Edit", match: :first

    fill_in "Name", with: @admin_option.name
    fill_in "Slug", with: @admin_option.slug
    click_on "Update Option"

    assert_text "Option was successfully updated"
    click_on "Back"
  end

  test "destroying a Option" do
    visit admin_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Option was successfully destroyed"
  end
end
