require "test_helper"

class ProductOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_option = product_options(:one)
  end

  test "should get index" do
    get product_options_url
    assert_response :success
  end

  test "should get new" do
    get new_product_option_url
    assert_response :success
  end

  test "should create product_option" do
    assert_difference('ProductOption.count') do
      post product_options_url, params: { product_option: { name: @product_option.name, slug: @product_option.slug } }
    end

    assert_redirected_to product_option_url(ProductOption.last)
  end

  test "should show product_option" do
    get product_option_url(@product_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_option_url(@product_option)
    assert_response :success
  end

  test "should update product_option" do
    patch product_option_url(@product_option), params: { product_option: { name: @product_option.name, slug: @product_option.slug } }
    assert_redirected_to product_option_url(@product_option)
  end

  test "should destroy product_option" do
    assert_difference('ProductOption.count', -1) do
      delete product_option_url(@product_option)
    end

    assert_redirected_to product_options_url
  end
end
