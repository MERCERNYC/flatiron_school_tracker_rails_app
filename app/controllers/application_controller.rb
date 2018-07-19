class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :require_login

 # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      redirect_to root_path
    end
  end

  private

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #@current_user is equal to the instance
  end

end
