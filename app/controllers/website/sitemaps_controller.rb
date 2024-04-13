class Website::SitemapsController < ApplicationController
  layout false

  skip_authorized_check :index
  skip_scoped_check :index

  def index
    render formats: :xml
  end
end
