require "test_helper"

class Api::ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get status" do
    get api_status_path
    assert_response :success
  end
end
