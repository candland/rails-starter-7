require "test_helper"

describe AccountsController do
  let(:account) { accounts(:one) }

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
    assert_difference("Account.count") do
      post accounts_url, params: {account: {name: @account.name}}
    end

    must_redirect_to account_url(Account.last)
  end

  it "should show account" do
    get account_url(@account)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_account_url(@account)
    must_respond_with :success
  end

  it "should update account" do
    patch account_url(@account), params: {account: {name: @account.name}}
    must_redirect_to account_url(account)
  end

  it "should destroy account" do
    assert_difference("Account.count", -1) do
      delete account_url(@account)
    end

    must_redirect_to accounts_url
  end
end
