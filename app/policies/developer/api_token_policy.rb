# frozen_string_literal: true

class Developer::ApiTokenPolicy < ApplicationPolicy
  def index?
    context.user.developer?
  end

  def show?
    context.user.developer?
  end

  def create?
    context.user.developer?
  end

  def new?
    context.user.developer?
  end

  def update?
    context.user.developer?
  end

  def edit?
    context.user.developer?
  end

  def destroy?
    context.user.developer?
  end

  def permitted_attributes
    [:name]
  end

  class Scope < Scope
    def resolve
      if context.user.developer?
        context.user.api_tokens
      else
        scope.none
      end
    end
  end
end
