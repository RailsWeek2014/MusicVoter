class CreateVoteTracks < ActiveRecord::Migration
  def change
    create_table :vote_tracks do |t|
      t.integer :user_id
      t.integer :track_id

      t.timestamps
    end
  end
end
