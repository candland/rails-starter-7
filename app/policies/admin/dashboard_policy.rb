class Admin::DashboardPolicy < ApplicationPolicy
  def show?
    context.user.admin?
  end

  def index?
    context.user.admin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
