class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :question, null: false
      t.datetime :expiration, null: false
      t.string :comment
      t.integer :creator_id, null: false
      t.boolean :active?, default: true

      t.timestamps
    end
  end
end
