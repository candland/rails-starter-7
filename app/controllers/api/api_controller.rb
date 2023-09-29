# frozen_string_literal: true

class Api::ApiController < ActionController::API
  include PunditCan::LoadAndAuthorize
  include Pagy::Backend

  before_action :prepare_exception_notifier
  before_action :set_default_format

  after_action :set_api_version_number
  after_action :count_api_request

  before_action :setup_current
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:status]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  rescue_from Pundit::NotAuthorizedError do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect} for #{current_user}"
    render json: {error: "Access denied"}, status: :forbidden
  end

  rescue_from Apipie::ParamMissing, with: :param_missing

  rescue_from Apipie::ParamMultipleMissing, with: :param_missing

  rescue_from Apipie::ParamInvalid, with: :param_invalid

  # Seems to catch errors
  # rescue_from StandardError, with: :standard_error

  # check_authorization
  skip_authorized_check :status
  skip_scoped_check :status

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :GET, "/status"
  def status
    render json: {status: "ok", code: 200}
  end

  protected

  # Set in devise strategy
  def claims
    request.params[:claims]
  end

  def token
    request.params[:token]
  end

  def current_ability
    @current_ability ||= Ability::Developer.new(current_user)
  end

  def set_default_format
    request.format = :json
  end

  def record_not_found
    render json: {error: "Record not found"}, status: :not_found
  end

  def param_missing ex
    render json: {error: ex.message}, status: :unprocessable_entity
  end

  def param_invalid ex
    render json: {error: ex.message}, status: :unprocessable_entity
  end

  def standard_error e
    puts "Rescue standard error for #{e.class}"
    render json: {error: e.message}, status: 500
  end

  def set_api_version_number
    response.set_header("Accept", "application/api.rails-starter-7.com; version=1")
  end

  def setup_current
    Current.user = current_user
    # Reset Time.zone back to UTC for APIs
    Time.zone = Time.find_zone("UTC")
  end

  private

  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
      current_user: current_user
    }
  end

  def count_api_request
    ApiToken.find_by(token: token).increment!(:calls) if token.present?
  end
end
