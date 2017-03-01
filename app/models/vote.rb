class Vote < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  has_one :poll, through: :answer

  validate :one_vote_per_poll

  def one_vote_per_poll
    if self.poll.votes.where(user_id: self.user_id).length > 0
      errors.add(:user_id, "can't vote more than once")
    end
  end
end
