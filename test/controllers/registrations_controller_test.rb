require "test_helper"

describe Devise::RegistrationsController do
  describe "New" do
    it "get new" do
      get new_user_registration_path
      assert_response :success
    end

    it "should create user" do
      assert_emails 1 do
        assert_difference("User.count") do
          post user_registration_path, params: {user: {
            first_name: "testfirst",
            last_name: "testlast",
            email: "test@localhost.com",
            password: "password"
          }}
        end
      end

      assert_redirected_to "/"

      user = User.order(created_at: :desc).first

      get user_confirmation_path(confirmation_token: user.confirmation_token)

      assert_redirected_to current_accounts_url
    end
  end

  describe "Update" do
    include Devise::Test::IntegrationHelpers

    let(:user) { create(:user, accounts: [account]) }
    let(:account) { create(:account) }

    before { sign_in(user) }

    it "should update" do
      assert_emails 1 do
        patch user_registration_path, params: {user: {
          first_name: "testfirst",
          last_name: "testlast",
          email: "test@localhost.com",
          password: "password",
          current_password: user.password
        }}
      end

      assert_redirected_to "/"
    end
  end
end
