class CreateJoinedUsers < ActiveRecord::Migration
  def change
    create_table :joined_users do |t|
      t.integer :user
      t.integer :playlist

      t.timestamps
    end
  end
end
