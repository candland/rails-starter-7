require "test_helper"

class UserTest < ActiveSupport::TestCase
  describe MaskedAttribute do
    let(:user) { create(:user) }

    it "should make constants" do
      assert User.const_defined?(:ROLES)
      assert User.const_defined?(:INDEXED_ROLES)
    end

    it "should get roles" do
      assert_equal [], user.roles
    end

    it "should set roles" do
      user.roles = [:admin]
      assert user.admin?
      assert_not user.sysadmin?

      user.roles = [:sysadmin]
      assert_not user.admin?
      assert user.sysadmin?
    end

    it "should add roles" do
      assert_not user.admin?

      user.add_admin!
      assert_equal [:admin], user.roles
      assert user.admin?
      assert_not user.sysadmin?

      user.add_sysadmin!
      assert_equal [:admin, :sysadmin], user.roles
      assert user.admin?
      assert user.sysadmin?

      user.add_sysadmin!
      user.add_admin!
      assert_equal [:admin, :sysadmin], user.roles
    end

    it "should add roles" do
      user.add_admin!
      user.add_sysadmin!
      assert_equal [:admin, :sysadmin], user.roles

      user.remove_admin!
      assert_equal [:sysadmin], user.roles

      user.remove_sysadmin!
      assert_equal [], user.roles

      user.remove_admin!
      user.remove_sysadmin!
      assert_equal [], user.roles
    end

    it "should provide scopes" do
      assert_equal 0, User.admins.count

      user.add_admin!
      assert_equal 1, User.admins.count
      assert_equal 1, User.with_roles(:admin).count
      assert_equal 0, User.with_roles(:admin, :sysadmin).count
      assert_equal 1, User.with_any_roles(:admin, :sysadmin).count

      user.add_sysadmin!
      assert_equal 1, User.admins.count
      assert_equal 1, User.with_roles(:admin, :sysadmin).count
    end
  end
end
