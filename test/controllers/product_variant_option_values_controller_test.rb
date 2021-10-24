require "test_helper"

class ProductVariantOptionValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_variant_option_value = product_variant_option_values(:one)
  end

  test "should get index" do
    get product_variant_option_values_url
    assert_response :success
  end

  test "should get new" do
    get new_product_variant_option_value_url
    assert_response :success
  end

  test "should create product_variant_option_value" do
    assert_difference('ProductVariantOptionValue.count') do
      post product_variant_option_values_url, params: { product_variant_option_value: { product_variant_id: @product_variant_option_value.product_variant_id, product_variant_option_id: @product_variant_option_value.product_variant_option_id } }
    end

    assert_redirected_to product_variant_option_value_url(ProductVariantOptionValue.last)
  end

  test "should show product_variant_option_value" do
    get product_variant_option_value_url(@product_variant_option_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_variant_option_value_url(@product_variant_option_value)
    assert_response :success
  end

  test "should update product_variant_option_value" do
    patch product_variant_option_value_url(@product_variant_option_value), params: { product_variant_option_value: { product_variant_id: @product_variant_option_value.product_variant_id, product_variant_option_id: @product_variant_option_value.product_variant_option_id } }
    assert_redirected_to product_variant_option_value_url(@product_variant_option_value)
  end

  test "should destroy product_variant_option_value" do
    assert_difference('ProductVariantOptionValue.count', -1) do
      delete product_variant_option_value_url(@product_variant_option_value)
    end

    assert_redirected_to product_variant_option_values_url
  end
end
