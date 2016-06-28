module AlbumsHelper
    
    def allow_track_edit?(track)
        return false unless current_user && !current_user.admin?
        track.user_id == current_user.id
    end
    
end
