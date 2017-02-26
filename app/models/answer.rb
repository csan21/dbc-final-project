class Answer < ApplicationRecord
  belongs_to :poll
  has_many :votes
end
