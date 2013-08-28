
class UsersController < ApplicationController  
  skip_before_action :require_login, :only => [:new, :create]
  def index
    @users = User.all
  end

  
  def show
    @users = User.find_by_id(params[:id])
    #@users = User.find_by_sql(["SELECT * FROM users WHERE id=?", params[:id]])
  end

  
  def new
      if request.post?
        @error = nil
        @users = User.create(params.require(:user).permit(:name,:email,:password,:password_confirmation))
        if @users.save
          session[:user_id] = @users.id
          session[:user_name] = @users.name
          redirect_to :action => 'index'
        else
          @error = @users.errors
          render 'new'
        end
      end
    end
  
    
    
  def edit
    @users = User.find(:all, :conditions => { :id => params[:id] })
  end
  
  def update
    @users = User.update(params[:id],params.require(:user).permit(:name,:email))
        if @users
             redirect_to @users
             else
               render 'edit'
         end
  end
  
  def destroy
    @users = User.find(params[:id])      
           if @users.destroy()
                redirect_to @users
           end
  end 
  
end