class AudienceVote < ApplicationRecord
  validates_uniqueness_of :phone_number
end
