require "application_system_test_case"

class CartProductsTest < ApplicationSystemTestCase
  setup do
    @cart_product = cart_products(:one)
  end

  test "visiting the index" do
    visit cart_products_url
    assert_selector "h1", text: "Cart Products"
  end

  test "creating a Cart product" do
    visit cart_products_url
    click_on "New Cart Product"

    fill_in "Cart", with: @cart_product.cart_id
    fill_in "Product", with: @cart_product.product_id
    fill_in "Quantity", with: @cart_product.quantity
    fill_in "Total", with: @cart_product.total
    click_on "Create Cart product"

    assert_text "Cart product was successfully created"
    click_on "Back"
  end

  test "updating a Cart product" do
    visit cart_products_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @cart_product.cart_id
    fill_in "Product", with: @cart_product.product_id
    fill_in "Quantity", with: @cart_product.quantity
    fill_in "Total", with: @cart_product.total
    click_on "Update Cart product"

    assert_text "Cart product was successfully updated"
    click_on "Back"
  end

  test "destroying a Cart product" do
    visit cart_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cart product was successfully destroyed"
  end
end
