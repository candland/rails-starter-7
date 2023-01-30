class Admin::DashboardController < Admin::AdminController
  skip_scoped_check :show

  def show
    authorize(:dashboard)
  end
end
