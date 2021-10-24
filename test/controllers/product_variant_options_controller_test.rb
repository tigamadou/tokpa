require "test_helper"

class ProductVariantOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_variant_option = product_variant_options(:one)
  end

  test "should get index" do
    get product_variant_options_url
    assert_response :success
  end

  test "should get new" do
    get new_product_variant_option_url
    assert_response :success
  end

  test "should create product_variant_option" do
    assert_difference('ProductVariantOption.count') do
      post product_variant_options_url, params: { product_variant_option: { product_option_id: @product_variant_option.product_option_id, product_variant_id: @product_variant_option.product_variant_id, value: @product_variant_option.value } }
    end

    assert_redirected_to product_variant_option_url(ProductVariantOption.last)
  end

  test "should show product_variant_option" do
    get product_variant_option_url(@product_variant_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_variant_option_url(@product_variant_option)
    assert_response :success
  end

  test "should update product_variant_option" do
    patch product_variant_option_url(@product_variant_option), params: { product_variant_option: { product_option_id: @product_variant_option.product_option_id, product_variant_id: @product_variant_option.product_variant_id, value: @product_variant_option.value } }
    assert_redirected_to product_variant_option_url(@product_variant_option)
  end

  test "should destroy product_variant_option" do
    assert_difference('ProductVariantOption.count', -1) do
      delete product_variant_option_url(@product_variant_option)
    end

    assert_redirected_to product_variant_options_url
  end
end
