class AddPlaylistToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :playlist, index: true
  end
end
