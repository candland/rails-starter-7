require "test_helper"

class Admin::UserPolicyTest < ActiveSupport::TestCase
  setup do
    @admin = create(:user, :admin)
    @other_user = create(:user)

    @policy = Admin::UserPolicy.new(OpenStruct.new(user: @admin), @admin)
    @other_policy = Admin::UserPolicy.new(OpenStruct.new(user: @other_user), @other_user)
  end

  def test_scope
    scope = Admin::UserPolicy::Scope.new(OpenStruct.new(user: @admin), @admin).resolve
    assert_equal 2, scope.count

    scope = Admin::UserPolicy::Scope.new(OpenStruct.new(user: @other_user), @other_user).resolve
    assert_equal 0, scope.count
  end

  def test_show
    assert @policy.show?
    refute @other_policy.show?
  end

  def test_create
    assert @policy.create?
    refute @other_policy.create?
  end

  def test_update
    assert @policy.update?
    refute @other_policy.update?
  end

  def test_destroy
    assert @policy.destroy?
    refute @other_policy.destroy?
  end

  def test_impersonate
    assert @policy.impersonate?
    refute @other_policy.impersonate?
  end
end
