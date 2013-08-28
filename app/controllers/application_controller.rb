class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery #with: :exception
  
  before_action :require_login
   
  private
  def require_login
     if session[:user_id] == nil
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/sessions/new' # halts request cycle
     end
  end
  
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
   helper_method :current_user
end
