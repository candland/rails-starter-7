require "test_helper"

class Developer::ApiTokensControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = create(:user, :developer)
    sign_in @user

    @api_token = create(:api_token, user: @user)
  end

  test "should get index" do
    get developer_api_tokens_url
    assert_response :success
  end

  test "should get new" do
    get new_developer_api_token_url
    assert_response :success
  end

  test "should create api_token" do
    assert_difference("ApiToken.count") do
      post developer_api_tokens_url, params: {api_token: attributes_for(:api_token)}
    end
    assert_redirected_to developer_api_token_url(ApiToken.order(created_at: :asc).last)
  end

  test "should show api_token" do
    get developer_api_token_url(@api_token)
    assert_response :success
  end

  test "should get edit" do
    get edit_developer_api_token_url(@api_token)
    assert_response :success
  end

  test "should update api_token" do
    patch developer_api_token_url(@api_token), params: {api_token: attributes_for(:api_token)}
    assert_redirected_to developer_api_token_url(@api_token)
  end

  test "should destroy api_token" do
    assert_difference("ApiToken.count", 0) do
      delete developer_api_token_url(@api_token)
    end

    @api_token.reload

    assert_not_nil @api_token.deleted_at

    assert_redirected_to developer_api_tokens_url
  end
end
