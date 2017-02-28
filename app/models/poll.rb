class Poll < ApplicationRecord
  has_many :answers
  has_many :votes, through: :answers
  belongs_to :creator, class_name: :User

  belongs_to :creator, class_name: :User

  accepts_nested_attributes_for :answers

  has_attached_file :image, styles: {medium: '300x300>'}

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def current?
    self.expiration > Time.now && self.active? == true
  end

  def sexy_expiration
    self.expiration.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long_ordinal)
  end

end
