class ApplicationController < ActionController::Base
  helper_method :current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def cat_belongs_to_owner
    cat_ids = []
    current_user.cats.each {|cat| cat_ids << cat.id }
    unless cat_ids.include?(params[:id].to_i)
      redirect_to cats_url
    end
  end

  def log_in(user)
    session[:session_token] = user.reset_session_token!
  end

  def login_status
    if current_user
      redirect_to cats_url
    end
  end
  # def log_out(user)
  #   user ? user.reset_session_token! : nil
  #   sessions[:session_token] = nil
  # end
  #
  # def log_out
  # end
  def current_user
    @current_user ||= User.find_by_session_token( session[:session_token] )
  end

end
