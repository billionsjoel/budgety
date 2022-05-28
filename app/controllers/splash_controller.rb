class SplashController < ApplicationController
  def index
    redirect_to :categories if current_user
  end
end
