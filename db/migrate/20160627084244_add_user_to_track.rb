class AddUserToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :author, :string
      add_column :tracks, :user_id, :references
  end
end
