# frozen_string_literal: true

# Used by tests in place of the Current object
class UserContext
  attr_reader :user, :account, :true_user

  def initialize(user, account, true_user = nil)
    @user = user
    @account = account
    @true_user = true_user
  end
end
