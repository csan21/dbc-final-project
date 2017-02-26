class Poll < ApplicationRecord
  has_many :answers
  has_many :votes, through: :answers
end
