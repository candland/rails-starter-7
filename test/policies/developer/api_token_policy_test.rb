require "test_helper"

class Developer::ApiTokenPolicyTest < ActiveSupport::TestCase
  class UserTest < Developer::ApiTokenPolicyTest
    setup do
      @user = create(:user)
      @account = @user.accounts.first
      @context = UserContext.new(@user, @account)

      @api_token = create(:api_token, user: @user)
    end

    test "for a user" do
      assert_permissions(@context, [:developer, @api_token],
        index: false,
        show: false,
        new: false,
        create: false,
        edit: false,
        update: false,
        destroy: false)
    end

    test "scope for a user" do
      assert_equal 0, Developer::ApiTokenPolicy::Scope.new(@context, ApiToken).resolve.count
    end
  end

  class DeveloperTest < Developer::ApiTokenPolicyTest
    setup do
      @user = create(:user, :developer)
      @account = @user.accounts.first
      @context = UserContext.new(@user, @account)

      @api_token = create(:api_token, user: @user)
    end

    test "for a developer" do
      assert_permissions(@context, [:developer, @api_token],
        index: true,
        show: true,
        new: true,
        create: true,
        edit: true,
        update: true,
        destroy: true)
    end

    test "scope for a developer" do
      assert_equal 1, Developer::ApiTokenPolicy::Scope.new(@context, ApiToken).resolve.count
    end
  end
end
