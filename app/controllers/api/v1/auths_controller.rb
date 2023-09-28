# frozen_string_literal: true

class Api::V1::AuthsController < Api::ApiController
  skip_before_action :authenticate_user!, only: [:create]
  skip_authorized_check :create
  skip_scoped_check :create

  resource_description do
    name "Authentication"
    description <<~EOS
    EOS
  end

  # Requires email and password params, accepts a name parameter
  # Returns an API token for the user if valid
  api :POST, "/v1/auth", "Get an auth token"
  description "method description"
  error code: :unprocessable_entity, desc: "Required parameter missing"
  error code: :unauthorized, desc: "Email and password are wrong"
  param :email, String, required: true
  param :password, String, required: true
  returns desc: "An token for bearer authentication." do
    property :token, String, desc: "JWT Token"
  end
  formats ["json"]
  meta authentication: "Bearer Token"
  def create
    user = User.find_by(email: auth_params[:email])
    if user&.valid_password?(auth_params[:password])
      @token = user.api_tokens.find_or_create_by(name: (auth_params[:name] || "default")) do |token|
        token.make_token.save!
      end
      render json: {
        token: @token.token
      }
    else
      head :unauthorized
    end
  end

  private

  def auth_params
    params.permit(:email, :password, :name)
  end
end
