require "test_helper"

class Website::RobotsControllerTest < ActionDispatch::IntegrationTest
  test "robots.txt" do
    get "/robots.txt"
    assert_response :success
  end
end
