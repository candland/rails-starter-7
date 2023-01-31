require "test_helper"

describe Admin::UsersController do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user, :admin) }
  let(:other_user) { create(:user, confirmed_at: nil, locked_at: DateTime.current) }

  before { sign_in(user) }

  it "should get index" do
    get admin_users_url
    must_respond_with :success
  end

  it "should get new" do
    get new_admin_user_url
    must_respond_with :success
  end

  it "should create user" do
    assert_difference("User.count") do
      post admin_users_url, params: {user: attributes_for(:user)}
    end
    must_redirect_to admin_users_url
  end

  it "should get edit" do
    get edit_admin_user_url(user)
    must_respond_with :success
  end

  it "should update user" do
    patch admin_user_url(user), params: {user: attributes_for(:user)}
    must_redirect_to admin_users_url

    assert user.reload
    refute user.locked_at?
    assert user.confirmed?
    assert_equal [:admin], user.roles
  end

  it "should update locked, confirmed, roles" do
    assert other_user.locked_at?
    refute other_user.confirmed?
    assert_equal [], other_user.roles

    patch admin_user_url(other_user), params: {user: {
      confirmed?: 1,
      locked_at?: 1,
      roles: ["", "admin"]
    }}
    must_redirect_to admin_users_url

    assert other_user.reload
    refute other_user.locked_at?
    assert other_user.confirmed?
    assert_equal [:admin], other_user.roles
  end

  it "should destroy user" do
    assert_difference("User.count", -1) do
      delete admin_user_url(user)
    end

    must_redirect_to admin_users_url
  end
end
