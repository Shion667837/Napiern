require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get rooms_home_url
    assert_response :success
  end

  test "should get index" do
    get rooms_index_url
    assert_response :success
  end
end
