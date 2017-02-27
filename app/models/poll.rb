class Poll < ApplicationRecord
  has_many :answers
  has_many :votes, through: :answers
  belongs_to :creator, class_name: :User

  def current?
    self.expiration > Time.now && self.active? == true
  end

  def sexy_expiration
    self.expiration.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long_ordinal)
  end

end
