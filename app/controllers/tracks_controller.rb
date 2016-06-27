class TracksController < ApplicationController
    
    before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @track = Track.all
    end
    
    def new
        @trackNew = Track.new 
    end
    
   # def create
   #     @albumId = Album.find(params[:album_id])
   #     @userId = User.find(params[:user_id])
   #     @trackNew = @albumId.track.build(tracks_params)
   #     if @trackNew.save 
   #         redirect_to album_path(@albumId)
   #     else 
   #         render 'new' 
   #     end 
   # end
    
    
    def create
        #@trackNew.users = current_user
        @albumId = Album.find(params[:album_id])
        @trackNew = @albumId.track.build(tracks_params)
        @trackNew.user = current_user
        if @trackNew.save 
            redirect_to album_path(@albumId)
        else 
            render 'new' 
        end 
    end
    
    def edit
       @trackEdit = Track.find(params[:id]) 
        @albumId = Album.find(params[:album_id])
    end
    
    def update 
        @trackEdit = Track.find(params[:id]) 
        if @trackEdit.update_attributes(tracks_params) 
            #srediti recirect na album
            #redirect_to controller: "albums", action: "show" ,:id => @albumId
            redirect_to root_path
        else 
            render 'edit' 
        end 
    end
    
    def destroy
        @trackDestroy = Track.find(params[:id])
        if @trackDestroy.destroy
            redirect_to root_path
        else
            render 'destory'
        end
    end
    
    private 
    def tracks_params 
        params.require(:track).permit(:name, :minutes)
    end
end
