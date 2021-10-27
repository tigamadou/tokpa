require "test_helper"

class Admin::OptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_option = admin_options(:one)
  end

  test "should get index" do
    get admin_options_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_option_url
    assert_response :success
  end

  test "should create admin_option" do
    assert_difference('Admin::Option.count') do
      post admin_options_url, params: { admin_option: { name: @admin_option.name, slug: @admin_option.slug } }
    end

    assert_redirected_to admin_option_url(Admin::Option.last)
  end

  test "should show admin_option" do
    get admin_option_url(@admin_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_option_url(@admin_option)
    assert_response :success
  end

  test "should update admin_option" do
    patch admin_option_url(@admin_option), params: { admin_option: { name: @admin_option.name, slug: @admin_option.slug } }
    assert_redirected_to admin_option_url(@admin_option)
  end

  test "should destroy admin_option" do
    assert_difference('Admin::Option.count', -1) do
      delete admin_option_url(@admin_option)
    end

    assert_redirected_to admin_options_url
  end
end
