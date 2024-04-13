require "test_helper"

class Website::WebsiteControllerTest < ActionDispatch::IntegrationTest
  test "root" do
    get "/"
    assert_response :success
  end

  test "404" do
    get "/404.html"
    assert_response :success
  end

  test "422" do
    get "/422.html"
    assert_response :success
  end

  test "500" do
    get "/500.html"
    assert_response :success
  end
end
