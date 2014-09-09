class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :youtube_id
      t.integer :votes, :default => 0
      t.boolean :accept, :default => false

      t.timestamps
    end
  end
end
