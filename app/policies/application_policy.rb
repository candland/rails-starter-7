# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :context, :record

  def initialize(context, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless context.user
    @context = context
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def permitted_attributes
    raise NotImplementedError, "You must define #permitted_attributes in #{self.class}"
  end

  class Scope
    def initialize(context, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless context.user
      @context = context
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :context, :scope
  end
end
