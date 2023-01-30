class Admin::AdminPolicy < ApplicationPolicy
  def index?
    context.user.admin?
  end

  def show?
    context.user.admin?
  end

  def create?
    context.user.admin?
  end

  def new?
    context.user.admin?
  end

  def update?
    context.user.admin?
  end

  def edit?
    context.user.admin?
  end

  def destroy?
    context.user.admin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
