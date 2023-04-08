require "test_helper"

class Public::RegionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_regions_index_url
    assert_response :success
  end

  test "should get show" do
    get public_regions_show_url
    assert_response :success
  end
end
