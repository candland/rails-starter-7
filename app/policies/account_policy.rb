class AccountPolicy < ApplicationPolicy
  def current?
    true
  end

  def create?
    true
  end

  def update?
    record.account_users.pluck(:user_id).include? context.user.id
  end

  def destroy?
    record.account_users.pluck(:user_id).include? context.user.id
  end

  def permitted_attributes
    [:name]
  end

  class Scope < Scope
    def resolve
      context.user.accounts
    end
  end
end
