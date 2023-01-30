class ApplicationController < ActionController::Base
  include PunditCan::LoadAndAuthorize
  include Pagy::Backend

  before_action :prepare_exception_notifier
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :setup_current

  layout :layout_by_resource

  protected

  rescue_from Pundit::NotAuthorizedError do |exception|
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: unauthenticated_root_url)
  end

  def pundit_user
    Current
  end

  def find_current_account
    if signed_in?
      # Lookup polciy directly to avoid the setting the scope check
      scope = Pundit.policy_scope!(pundit_user, Account)
      current_account_id = session[:current_account_id] ||= scope.first.try(:id)
      if current_account_id
        set_current_account scope.where(id: current_account_id).first
      end
    end
  end

  def set_current_account account
    if !account
      session[:current_account_id] = nil
      find_current_account
    else
      session[:current_account_id] = account.id
      Current.account = account
    end
  end

  def setup_current
    Current.user = current_user
    Current.account = find_current_account
  end

  def layout_by_resource
    devise_controller? ? "public" : "application"
  end

  def after_sign_out_path_for(resource)
    session_path(resource)
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || current_accounts_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
      current_user: current_user
    }
  end
end
