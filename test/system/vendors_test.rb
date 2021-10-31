require "application_system_test_case"

class VendorsTest < ApplicationSystemTestCase
  setup do
    @vendor = vendors(:one)
  end

  test "visiting the index" do
    visit vendors_url
    assert_selector "h1", text: "Vendors"
  end

  test "creating a Vendor" do
    visit vendors_url
    click_on "New Vendor"

    check "Activated" if @vendor.activated
    fill_in "Cover", with: @vendor.cover
    fill_in "Description", with: @vendor.description
    fill_in "Image", with: @vendor.image
    fill_in "Incorporation date", with: @vendor.incorporation_date
    fill_in "Legal name", with: @vendor.legal_name
    fill_in "Name", with: @vendor.name
    check "Online" if @vendor.online
    fill_in "Registration address", with: @vendor.registration_address
    fill_in "Registration date", with: @vendor.registration_date
    fill_in "Registration number", with: @vendor.registration_number
    check "Verified" if @vendor.verified
    click_on "Create Vendor"

    assert_text "Vendor was successfully created"
    click_on "Back"
  end

  test "updating a Vendor" do
    visit vendors_url
    click_on "Edit", match: :first

    check "Activated" if @vendor.activated
    fill_in "Cover", with: @vendor.cover
    fill_in "Description", with: @vendor.description
    fill_in "Image", with: @vendor.image
    fill_in "Incorporation date", with: @vendor.incorporation_date
    fill_in "Legal name", with: @vendor.legal_name
    fill_in "Name", with: @vendor.name
    check "Online" if @vendor.online
    fill_in "Registration address", with: @vendor.registration_address
    fill_in "Registration date", with: @vendor.registration_date
    fill_in "Registration number", with: @vendor.registration_number
    check "Verified" if @vendor.verified
    click_on "Update Vendor"

    assert_text "Vendor was successfully updated"
    click_on "Back"
  end

  test "destroying a Vendor" do
    visit vendors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vendor was successfully destroyed"
  end
end
