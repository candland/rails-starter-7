class UserPolicy < ApplicationPolicy
  def index?
    context.user == record
  end

  def show?
    context.user == record
  end

  def create?
    true
  end

  def update?
    context.user == record
  end

  def destroy?
    context.user == record
  end

  def permitted_attributes
    [:email, :password, :first_name, :last_name, :password_confirmation, :current_password]
  end

  class Scope < Scope
    def resolve
      User.where(id: context.user.id)
    end
  end
end
