require "test_helper"

class Public::GroupControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_group_show_url
    assert_response :success
  end

  test "should get join" do
    get public_group_join_url
    assert_response :success
  end
end
