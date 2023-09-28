# frozen_string_literal: true

class DeveloperPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    context.user.developer?
  end

  def docs?
    context.user.developer?
  end

  def permitted_attributes
    []
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
