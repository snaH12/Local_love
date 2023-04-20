require "test_helper"

class Admin::RegionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_regions_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_regions_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_regions_edit_url
    assert_response :success
  end

  test "should get create" do
    get admin_regions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_regions_destroy_url
    assert_response :success
  end
end
