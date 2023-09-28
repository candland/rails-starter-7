class PublicController < ApplicationController
  skip_scoped_check :home
  skip_authorized_check :home

  def home
  end
end
