# frozen_string_literal: true

class ConfirmationsController < Devise::ConfirmationsController
  protected

  def after_confirmation_path_for resource_name, resource
    sign_in(resource)
    current_accounts_url
  end
end
