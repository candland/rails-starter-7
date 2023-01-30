require "test_helper"

class AccountPolicyTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    @account = create(:account, users: [@user])

    _other_account = create(:account)

    @policy = AccountPolicy.new(OpenStruct.new(user: @user), @account)
  end

  def test_scope
    scope = AccountPolicy::Scope.new(OpenStruct.new(user: @user), @account).resolve

    assert_equal 1, scope.count
    assert_equal @account, scope.first
  end

  def test_show
    assert @policy.show?
  end

  def test_create
    assert @policy.create?
  end

  def test_update
    assert @policy.update?
  end

  def test_destroy
    assert @policy.destroy?
  end

  def test_current
    assert @policy.current?
  end
end
