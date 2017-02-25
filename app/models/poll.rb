class Poll < ApplicationRecord
  has_many :answers
  belongs_to :final_choice, class_name: :Answer
end
