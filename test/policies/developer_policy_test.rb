require "test_helper"

class DeveloperPolicyTest < ActiveSupport::TestCase
  class UserTest < DeveloperPolicyTest
    setup do
      @user = create(:user)
      @account = @user.accounts.first
      @context = UserContext.new(@user, @account)
    end

    test "for a user" do
      assert_permissions(@context, @developer,
        index: false,
        show: false,
        new: false,
        create: false,
        edit: false,
        update: false,
        destroy: false,
        docs: false)
    end
  end

  class DeveloperTest < DeveloperPolicyTest
    setup do
      @user = create(:user, :developer)
      @account = @user.accounts.first
      @context = UserContext.new(@user, @account)
    end

    test "for a developer" do
      assert_permissions(@context, @developer,
        index: false,
        show: true,
        new: false,
        create: false,
        edit: false,
        update: false,
        destroy: false,
        docs: true)
    end
  end
end
