class UsersController < ApplicationController
  skip_scoped_check :stop_impersonating
  load_resource

  def stop_impersonating
    stop_impersonating_user
    redirect_to admin_users_path
  end
end
