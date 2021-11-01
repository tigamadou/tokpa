require "application_system_test_case"

class SubcategoriesTest < ApplicationSystemTestCase
  setup do
    @subcategory = subcategories(:one)
  end

  test "visiting the index" do
    visit subcategories_url
    assert_selector "h1", text: "Subcategories"
  end

  test "creating a Subcategory" do
    visit subcategories_url
    click_on "New Subcategory"

    check "Activated" if @subcategory.activated
    fill_in "Category", with: @subcategory.category_id
    fill_in "Name", with: @subcategory.name
    fill_in "Slug", with: @subcategory.slug
    click_on "Create Subcategory"

    assert_text "Subcategory was successfully created"
    click_on "Back"
  end

  test "updating a Subcategory" do
    visit subcategories_url
    click_on "Edit", match: :first

    check "Activated" if @subcategory.activated
    fill_in "Category", with: @subcategory.category_id
    fill_in "Name", with: @subcategory.name
    fill_in "Slug", with: @subcategory.slug
    click_on "Update Subcategory"

    assert_text "Subcategory was successfully updated"
    click_on "Back"
  end

  test "destroying a Subcategory" do
    visit subcategories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subcategory was successfully destroyed"
  end
end
