class AddPlaylistToPlayer < ActiveRecord::Migration
  def change
    add_reference :players, :playlist, index: true
  end
end
