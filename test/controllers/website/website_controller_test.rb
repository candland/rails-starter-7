require "test_helper"

class Website::WebsiteControllerTest < ActionDispatch::IntegrationTest
  test "root" do
    get "/"
    assert_response :success
  end
end
