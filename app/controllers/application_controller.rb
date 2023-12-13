class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    redirect_to login_path, alert: 'You must be logged in.' unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
