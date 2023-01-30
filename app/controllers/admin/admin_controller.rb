class Admin::AdminController < ApplicationController
  # Scope pundit to admin
  def policy_scope(scope, **kwargs)
    super([:admin, scope], **kwargs)
  end

  # Scope pundit to admin
  def authorize(record, query = nil, **kwargs)
    super([:admin, record], query, **kwargs)
  end

  # Scope pundit to admin
  def permitted_attributes(record, action = action_name)
    super([:admin, record], action)
  end
end
