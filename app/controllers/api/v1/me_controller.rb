# frozen_string_literal: true

class Api::V1::MeController < Api::ApiController
  skip_authorized_check :show
  skip_scoped_check :show

  resource_description do
    name "Me"
    description <<~EOS
      Get information about the currently authorized API user.
    EOS
  end

  api :GET, "/v1/me", "Show a me"
  description "method description"
  returns desc: "User information" do
    param :user, Hash, desc: "User info" do
      param :id, String, desc: "User Id"
      param :email, String
      param :first_name, String
      param :last_name, String
      param :gravatar_url, String
      param :roles, Array
    end
  end
  formats ["json"]
  meta authentication: "Bearer Token"
  def show
    render partial: "users/user", locals: {user: current_user}
  end
end
