require "test_helper"

class UserPolicyTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    @other_user = create(:user)

    @policy = UserPolicy.new(OpenStruct.new(user: @user), @user)
    @other_policy = UserPolicy.new(OpenStruct.new(user: @user), @other_user)
  end

  def test_scope
    scope = UserPolicy::Scope.new(OpenStruct.new(user: @user), @user).resolve

    assert_equal 1, scope.count
    assert_equal @user, scope.first
  end

  def test_show
    assert @policy.show?
    refute @other_policy.show?
  end

  def test_create
    assert @policy.create?
    refute @other_policy.show?
  end

  def test_update
    assert @policy.update?
    refute @other_policy.show?
  end

  def test_destroy
    assert @policy.destroy?
    refute @other_policy.show?
  end
end
