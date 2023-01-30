require "test_helper"

describe AccountsController do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user, accounts: [account]) }
  let(:account) { create(:account) }

  describe "Signed in" do
    before { sign_in(user) }

    it "should get index" do
      get accounts_url
      must_respond_with :success
    end

    it "should get new" do
      get new_account_url
      must_respond_with :success
    end

    it "should get current" do
      get current_accounts_url
      must_respond_with :success
    end

    it "should create account" do
      assert_difference "Account.count" => 1 do
        post accounts_url, params: {account: attributes_for(:account)}
      end

      _(user.accounts.count).must_equal 2
      must_redirect_to account_url(Account.order(created_at: :desc).first)
    end

    it "should show account" do
      get account_url(account)
      must_respond_with :success
    end

    it "should get edit" do
      get edit_account_url(account)
      must_respond_with :success
    end

    it "should update account" do
      patch account_url(account), params: {account: {name: "New Name"}}
      must_redirect_to account_url(account)
      assert account.reload

      assert_equal "New Name", account.name
    end

    it "should destroy account" do
      assert_difference("Account.count", -1) do
        delete account_url(account)
      end

      must_redirect_to accounts_url
    end
  end

  describe "No sign in" do
    it "should not allow" do
      get accounts_url
      must_respond_with :redirect
      must_redirect_to new_user_session_url
    end
  end
end
