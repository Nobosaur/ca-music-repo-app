class AlbumsController < ApplicationController
   
    before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @albums = Album.all
    end
    
    def new
        @albumNew = Album.new
    end
    
    def create
        @AlbumNew = Album.new(album_params) 
        if @AlbumNew.save 
            redirect_to root_path
        else 
            render 'new' 
        end 
    end
    
    def show
        @album = Album.find(params[:id])
        @tracks = @album.track
    end
    
    def edit
       @albumEdit = Album.find(params[:id])  
    end
    
    def update 
        @albumEdit = Album.find(params[:id]) 
        if @albumEdit.update_attributes(album_params) 
            redirect_to(:action => 'show', :id => @albumEdit.id) 
        else 
            render 'edit' 
        end 
    end
    
    def destroy
        @albumDestroy = Album.find(params[:id])
        if @albumDestroy.destroy
            redirect_to root_path
        else
            render 'destory'
        end
    end
    
    private 
    def album_params 
        params.require(:album).permit(:cover, :title, :artist) 
    end
end