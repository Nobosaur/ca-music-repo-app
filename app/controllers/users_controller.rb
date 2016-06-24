class UsersController < ApplicationController
    
    before_action :require_admin, only: [:index, :edit, :update, :destroy]
    
    def index
        @userAll = User.all
    end
    
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
    
    def edit
       @userEdit = User.find(params[:id])  
    end
    
    def update 
        @userEdit = User.find(params[:id]) 
        if @userEdit.update_attributes(user_params_edit) 
            redirect_to users_path
        else 
            render 'edit' 
        end 
    end
    
    def destroy
        @userDestroy = User.find(params[:id])
        if @userDestroy.destroy
            redirect_to users_path
        else
            render 'destory'
        end
    end
    
    private
    
     def user_params_edit
        params.require(:user).permit(:first_name, :last_name, :email, :role)
    end
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
    
end
