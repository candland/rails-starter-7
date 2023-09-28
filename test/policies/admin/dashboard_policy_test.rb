require "test_helper"

class Admin::DashboardPolicyTest < ActiveSupport::TestCase
  class UserTest < Admin::DashboardPolicyTest
    setup do
      @user = create(:user)

      @policy = Admin::DashboardPolicy.new(OpenStruct.new(user: @user), @user)
    end

    def test_show
      refute @policy.show?
    end
  end

  class AdminTest < Admin::DashboardPolicyTest
    setup do
      @user = create(:user, :admin)

      @policy = Admin::DashboardPolicy.new(OpenStruct.new(user: @user), @user)
    end

    def test_show
      assert @policy.show?
    end
  end
end
