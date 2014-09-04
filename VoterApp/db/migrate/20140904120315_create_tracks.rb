class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :url
      t.float :length
      t.integer :votes

      t.timestamps
    end
  end
end