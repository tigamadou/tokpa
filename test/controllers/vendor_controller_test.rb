require "test_helper"

class VendorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vendor_index_url
    assert_response :success
  end

  test "should get show" do
    get vendor_show_url
    assert_response :success
  end
end
