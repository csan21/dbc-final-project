class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.references :poll, foreign_key: true
      t.boolean :chosen?, default: false

      t.timestamps
    end
  end
end
