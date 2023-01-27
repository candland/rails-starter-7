class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_by_resource

  protected

  def layout_by_resource
    devise_controller? ? "public" : "application"
  end

  def after_sign_out_path_for(resource)
    session_path(resource)
  end

  def after_sign_in_path_for(resource)
    if resource.instance_of?(Admin)
      admin_dashboard_path
    else
      stored_location_for(resource) || current_accounts_path
    end
  end
end
