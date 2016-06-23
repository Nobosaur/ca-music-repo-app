class SessionsController < ApplicationController
    
    def new
        
    end
    
    def create
      @userLogin = User.find_by_email(params[:session][:email])
      if @userLogin && @userLogin.authenticate(params[:session][:password])
        session[:user_id] = @userLogin.id
        redirect_to root_path
      else
        redirect_to '/login'
      end 
    end
    
    def destroy 
        session[:user_id] = nil 
        redirect_to root_path
    end
    
end
