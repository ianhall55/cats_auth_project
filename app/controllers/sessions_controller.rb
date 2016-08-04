class SessionsController < ApplicationController
  before_action :login_status, only: [:new, :create]
  def new
  end

  def destroy
    current_user ? current_user.reset_session_token! : nil
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])
    if @user
      log_in(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["404: User not found"]
      render :new
    end
  end

private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
