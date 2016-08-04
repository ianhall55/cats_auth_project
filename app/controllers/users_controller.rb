class UsersController < ApplicationController
  before_action :login_status

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      msg = UserMailer.welcome_email(@user)
      msg.deliver
      
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :session_token)
    end
end
