require "test_helper"

class Admin::DashboardPolicyTest < ActiveSupport::TestCase
  setup do
    @user = create(:user, :admin)

    @policy = UserPolicy.new(OpenStruct.new(user: @user), @user)
  end

  def test_show
    assert @policy.show?
  end
end
