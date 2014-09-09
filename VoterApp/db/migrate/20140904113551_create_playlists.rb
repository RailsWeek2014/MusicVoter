class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end
