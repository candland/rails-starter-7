require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "home" do
    get unauthenticated_root
    assert_response :success
  end
end
