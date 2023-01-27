require "test_helper"

describe HealthController do
  it "#status returns 200" do
    get "/status"
    assert_response 200
    assert_equal JSON.parse(response.body)["status"], 200
  end
end
