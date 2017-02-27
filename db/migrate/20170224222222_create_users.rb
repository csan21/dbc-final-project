class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest, null: false
      t.string :name
      t.string :invite_code
      t.string :phone_number
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
