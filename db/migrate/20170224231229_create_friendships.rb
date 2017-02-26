class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :adder_id
      t.integer :accepter_id
      t.boolean :accepted?, default: false

      t.timestamps
    end
  end
end
