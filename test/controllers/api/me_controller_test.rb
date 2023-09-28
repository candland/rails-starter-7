require "test_helper"

class MeControllerTest < ActionDispatch::IntegrationTest
  test "returns current user details" do
    token = create(:api_token, user: create(:user, :developer))
    user = token.user

    get api_v1_me_url, headers: {Authorization: "Bearer #{user.api_tokens.first.token}"}
    assert_response :success

    assert_equal user.first_name, response.parsed_body["first_name"]
  end
end
