class Website::WebsiteController < Sitepress::SiteController
  layout "website"

  skip_scoped_check :show
  skip_authorized_check :show

  protected

  def signed_in?
    false
  end

  def current_user
    nil
  end

  def current_account
    nil
  end

  def setup_current
    Current.user = nil
    Current.true_user = nil
    Current.account = nil
  end
end
