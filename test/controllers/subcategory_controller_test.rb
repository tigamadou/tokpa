require "test_helper"

class SubcategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subcategory_index_url
    assert_response :success
  end

  test "should get show" do
    get subcategory_show_url
    assert_response :success
  end
end
