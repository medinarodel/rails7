class SessionsController < ApplicationController
  layout 'session'

  skip_before_action :authenticate_user!, only: %w[new create]

  def new
    # Render login page
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
