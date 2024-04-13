require "test_helper"

class Website::SitemapsControllerTest < ActionDispatch::IntegrationTest
  test "sitemap.xml" do
    get "/sitemap.xml"
    assert_response :success
  end
end
