class TracksController < ApplicationController
    def index
        @track = Track.all
    end
    
    def new
        @trackNew = Track.new
        #@albumId = Album.find(params[:album_id])
    end
    
    def create
        @albumId = Album.find(params[:album_id])
        #album = @albumId
        #@trackNew = @albumId.tracks.create(tracks_params)
        #track.save # => saves both post and comment
        @trackNew = @albumId.track.create(tracks_params)
        if @trackNew.save 
            redirect_to root_path
        else 
            render 'new' 
        end 
    end
    
    def edit
       @trackEdit = Track.find(params[:id])  
    end
    
    def update 
        @trackEdit = Track.find(params[:id]) 
        if @trackEdit.update_attributes(tracks_params) 
            #srediti recirect na album
            #redirect_to controller: "albums", action: "show" ,:id => @album.id
            redirect_to root_path
        else 
            render 'edit' 
        end 
    end
    
    private 
    def tracks_params 
        params.require(:track).permit(:name, :minutes) 
    end
end
