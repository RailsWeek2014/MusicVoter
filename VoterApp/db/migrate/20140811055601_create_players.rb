class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.boolean :set_votes_to_null, :default => true
      t.integer :dj_id

      t.timestamps
    end
  end
end
