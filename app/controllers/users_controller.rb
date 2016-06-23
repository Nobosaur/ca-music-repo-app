class UsersController < ApplicationController
    
    def new
        @userNew = User.new
    end
    
    def create
        @userNew = User.new(user_params) 
        if @userNew.save 
            redirect_to root_path
        else 
            redirect_to "/signup" 
        end  
    end
    
    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
    
end
