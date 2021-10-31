require "application_system_test_case"

class ProductVariantOptionsTest < ApplicationSystemTestCase
  setup do
    @product_variant_option = product_variant_options(:one)
  end

  test "visiting the index" do
    visit product_variant_options_url
    assert_selector "h1", text: "Product Variant Options"
  end

  test "creating a Product variant option" do
    visit product_variant_options_url
    click_on "New Product Variant Option"

    fill_in "Product option", with: @product_variant_option.product_option_id
    fill_in "Product variant", with: @product_variant_option.product_variant_id
    fill_in "Value", with: @product_variant_option.value
    click_on "Create Product variant option"

    assert_text "Product variant option was successfully created"
    click_on "Back"
  end

  test "updating a Product variant option" do
    visit product_variant_options_url
    click_on "Edit", match: :first

    fill_in "Product option", with: @product_variant_option.product_option_id
    fill_in "Product variant", with: @product_variant_option.product_variant_id
    fill_in "Value", with: @product_variant_option.value
    click_on "Update Product variant option"

    assert_text "Product variant option was successfully updated"
    click_on "Back"
  end

  test "destroying a Product variant option" do
    visit product_variant_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product variant option was successfully destroyed"
  end
end
