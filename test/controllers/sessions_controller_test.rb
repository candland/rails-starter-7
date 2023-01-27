require "test_helper"

describe Devise::SessionsController do
  let(:user) { create(:user) }

  it "should get new session" do
    get new_user_session_path
    assert_response :success
  end

  it "should create new session without account" do
    post user_session_path, params: {user: {
      email: user.email,
      password: user.password,
      remember_me: "1"
    }}

    assert_redirected_to current_accounts_url
  end

  it "should create new session with account" do
    _account = create(:account, users: [user])

    post user_session_path, params: {user: {
      email: user.email,
      password: user.password,
      remember_me: "1"
    }}

    assert_redirected_to current_accounts_url
  end

  it "should destroy session" do
    get destroy_user_session_path
    assert_redirected_to new_user_session_url
  end
end
