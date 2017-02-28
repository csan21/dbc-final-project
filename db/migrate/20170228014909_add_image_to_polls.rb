class AddImageToPolls < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :polls, :image
  end

  def self.down
    remove_attachment :polls, :image
  end
end
