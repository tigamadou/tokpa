require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    check "Active" if @product.active
    check "Available" if @product.available
    fill_in "Brand", with: @product.brand_id
    fill_in "Description", with: @product.description
    fill_in "Name", with: @product.name
    fill_in "Slug", with: @product.slug
    fill_in "Subcategory", with: @product.subcategory_id
    check "Validated" if @product.validated
    fill_in "Vendor", with: @product.vendor_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    check "Active" if @product.active
    check "Available" if @product.available
    fill_in "Brand", with: @product.brand_id
    fill_in "Description", with: @product.description
    fill_in "Name", with: @product.name
    fill_in "Slug", with: @product.slug
    fill_in "Subcategory", with: @product.subcategory_id
    check "Validated" if @product.validated
    fill_in "Vendor", with: @product.vendor_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
