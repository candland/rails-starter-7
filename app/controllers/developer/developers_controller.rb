# frozen_string_literal: true

class Developer::DevelopersController < ApplicationController
  # Scope pundit to admin
  def policy_scope(scope, **kwargs)
    super([:developer, scope], **kwargs)
  end

  # Scope pundit to admin
  def authorize(record, query = nil, **kwargs)
    super([:developer, record], query, **kwargs)
  end

  # Scope pundit to admin
  def permitted_attributes(record, action = action_name)
    super([:developer, record], action)
  end
end
