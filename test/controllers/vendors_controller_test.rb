require "test_helper"

class VendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendor = vendors(:one)
  end

  test "should get index" do
    get vendors_url
    assert_response :success
  end

  test "should get new" do
    get new_vendor_url
    assert_response :success
  end

  test "should create vendor" do
    assert_difference('Vendor.count') do
      post vendors_url, params: { vendor: { activated: @vendor.activated, cover: @vendor.cover, description: @vendor.description, image: @vendor.image, incorporation_date: @vendor.incorporation_date, legal_name: @vendor.legal_name, name: @vendor.name, online: @vendor.online, registration_address: @vendor.registration_address, registration_date: @vendor.registration_date, registration_number: @vendor.registration_number, verified: @vendor.verified } }
    end

    assert_redirected_to vendor_url(Vendor.last)
  end

  test "should show vendor" do
    get vendor_url(@vendor)
    assert_response :success
  end

  test "should get edit" do
    get edit_vendor_url(@vendor)
    assert_response :success
  end

  test "should update vendor" do
    patch vendor_url(@vendor), params: { vendor: { activated: @vendor.activated, cover: @vendor.cover, description: @vendor.description, image: @vendor.image, incorporation_date: @vendor.incorporation_date, legal_name: @vendor.legal_name, name: @vendor.name, online: @vendor.online, registration_address: @vendor.registration_address, registration_date: @vendor.registration_date, registration_number: @vendor.registration_number, verified: @vendor.verified } }
    assert_redirected_to vendor_url(@vendor)
  end

  test "should destroy vendor" do
    assert_difference('Vendor.count', -1) do
      delete vendor_url(@vendor)
    end

    assert_redirected_to vendors_url
  end
end
