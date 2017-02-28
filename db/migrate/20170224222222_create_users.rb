class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest, null: false
      t.string :name
      t.string :invite_code
      t.string :phone_number, null: false
      t.timestamps null: false
      t.string   :remember_digest
      t.string   :access_token, index: true, unique: true
      t.string   :reset_digest
      t.datetime :reset_sent_at
    end
    add_index :users, :email, unique: true
  end
end
