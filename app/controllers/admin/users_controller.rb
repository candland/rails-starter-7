class Admin::UsersController < Admin::AdminController
  load_resource

  def index
  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_url, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    p = user_params
    if @user.update(p)
      redirect_to admin_users_url, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: "User was successfully destroyed."
  end

  def impersonate
    impersonate_user(@user)
    redirect_to current_accounts_path
  end

  private

  def user_params
    permitted_attributes(User).tap do |user_params|
      if user_params.delete(:confirmed?) == "1" && !@user.confirmed?
        user_params[:confirmed_at] = DateTime.current
      else
        user_params.delete(:confirmed_at)
      end

      if user_params.delete(:locked_at?) == "1"
        user_params[:locked_at] = nil
      else
        user_params.delete(:locked_at)
      end

      if user_params[:password].blank?
        user_params.delete(:password)
      else
        user_params[:password_confirmation] = user_params[:password]
      end

      if user_params[:roles]
        str_roles = User::ROLES.map(&:to_s)
        user_params[:roles] = user_params[:roles].flat_map do |role_str|
          if str_roles.include?(role_str)
            role_str.to_sym
          end
        end.compact
      end
    end
  end
end
