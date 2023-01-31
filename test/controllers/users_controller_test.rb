require "test_helper"

describe UsersController do
  include Devise::Test::IntegrationHelpers

  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }

  before { sign_in(admin) }

  it "stop_impersonating" do
    get impersonate_admin_user_path(user)
    assert_redirected_to current_accounts_url

    get new_account_path
    assert_response :success

    assert_match "You (#{admin.first_name}) are signed in as #{CGI.escapeHTML(user.to_s)}", response.body

    get stop_impersonating_users_path
    assert_redirected_to admin_users_path
  end
end
