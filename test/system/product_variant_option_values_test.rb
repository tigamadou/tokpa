require "application_system_test_case"

class ProductVariantOptionValuesTest < ApplicationSystemTestCase
  setup do
    @product_variant_option_value = product_variant_option_values(:one)
  end

  test "visiting the index" do
    visit product_variant_option_values_url
    assert_selector "h1", text: "Product Variant Option Values"
  end

  test "creating a Product variant option value" do
    visit product_variant_option_values_url
    click_on "New Product Variant Option Value"

    fill_in "Product variant", with: @product_variant_option_value.product_variant_id
    fill_in "Product variant option", with: @product_variant_option_value.product_variant_option_id
    click_on "Create Product variant option value"

    assert_text "Product variant option value was successfully created"
    click_on "Back"
  end

  test "updating a Product variant option value" do
    visit product_variant_option_values_url
    click_on "Edit", match: :first

    fill_in "Product variant", with: @product_variant_option_value.product_variant_id
    fill_in "Product variant option", with: @product_variant_option_value.product_variant_option_id
    click_on "Update Product variant option value"

    assert_text "Product variant option value was successfully updated"
    click_on "Back"
  end

  test "destroying a Product variant option value" do
    visit product_variant_option_values_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product variant option value was successfully destroyed"
  end
end
