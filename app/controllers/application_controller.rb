class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def require_login
    if session[:user_id] == nil
      redirect_to(:controller => "users", :action => "login")
    end
  end

  protect_from_forgery with: :exception
end
