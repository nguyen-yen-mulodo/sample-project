class ApiTestController < ApplicationController
#  before_filter :protect_from_forgery, :except => [:post_user]  
    
  respond_to :json, :xml, :html
    def show_all
      @users = User.all
      respond_with(@users)
    end
    
  def show_json
    @users = User.all
     if @users!=nil
#       render :json => @users.to_json(:only=>[:name,:email]), :status => :ok, :callback => params[:callback]
       render :json => { :success => true, 
         :user => @users.as_json(:only => [:email,:name]) }
#       render :json => @users

     else
     render :json => {:error => '404'}, :status => :not_found, :callback => params[:callback]
    end
   end
   
  def show_xml
    @users = User.all
     if @users!=nil
#       render :json => @users.to_json(:only=>[:name,:email]), :status => :ok, :callback => params[:callback]
       render :xml => { :success => true, 
         :user => @users.as_json(:only => [:email,:name]) }
#       render :json => @users

     else
     render :xml => {:error => '404'}, :status => :not_found, :callback => params[:callback]
    end
   end
   
   
  def get_user
    @users = User.find_by_id(params[:id])
       if @users!=nil
         render :json => { :success => true,
           :user => @users.as_json(:only => [:email,:name]) }
  
       else
       render :json => {:error => '404'}, :status => :not_found, :callback => params[:callback]
      end
     end
     
  def post_user
   
    @users = User.all
         if @users!=nil
           render :json => { :success => true, 
             :user => @users.as_json(:only => [:email,:name]) }
    
         else
         render :json => {:error => '404'}, :status => :not_found, :callback => params[:callback]
        end
       end
       

end
