class CreateJoinedUsers < ActiveRecord::Migration
  def change
    create_table :joined_users do |t|
      t.integer :user_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
