class Answer < ApplicationRecord
  belongs_to :poll
  has_many :votes

  validates :text, presence: true
end
