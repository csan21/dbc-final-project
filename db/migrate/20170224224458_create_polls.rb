class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :question
      t.datetime :expiration
      t.string :comment
      t.integer :creator_id
      t.integer :final_choice_id

      t.timestamps
    end
  end
end
