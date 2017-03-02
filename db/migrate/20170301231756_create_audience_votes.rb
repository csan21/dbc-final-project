class CreateAudienceVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :audience_votes do |t|
      t.string :phone_number
      t.boolean :yes?
    end
  end
end
