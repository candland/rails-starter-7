class Website::RobotsController < ApplicationController
  layout false

  skip_authorized_check :index
  skip_scoped_check :index

  def index
    render format: :text
  end
end
