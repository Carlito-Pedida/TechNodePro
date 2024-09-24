class ApplicationController < ActionController::Base
helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "Your are not allowed to perform this operation. Please sign up or sign in."
      redirect_to login_path
    end
  end
end
