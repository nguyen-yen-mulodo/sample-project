class SessionsController < ApplicationController
    skip_before_action :require_login, :only => [:new, :create]
#    before_action :set_user, only: [:show, :edit, :update, :destroy]
    def new
 
    end
  
    def create
      if user = User.authenticate(params[:email],params[:password])
            session[:user_id] = user.id
            session[:user_name] = user.name
            
            if params[:remember_me]
              cookies[:user_email] = { :value => user.email, :expires => 1.hours.from_now }
              cookies[:user_password] = { :value => params[:password], :expires => 1.hours.from_now }
            else
              cookies.delete(:user_email)
              cookies.delete(:user_password)
            end
            redirect_to users_url
      else
        flash[:error] = 'Invalid email/password combination' # Not quite right!
        render "new"
      end
    end
  
    def destroy
      session[:user_id] = nil
      session[:user_name] = nil
      reset_session
      redirect_to :action => 'new'
    end
    
    public
    def logged_in
      if session[:user_id]
        return true
      else
        return false
      end
    end
   
end
