class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_polls, class_name: :Poll, foreign_key: :creator_id
  has_many :votes
  has_many :chosen_answers, through: :votes, source: :answer
  has_many :taken_polls, through: :chosen_answers, source: :poll
  has_many :initiated_friendships, class_name: :Friendship, foreign_key: :adder_id
  has_many :accepted_friendships, class_name: :Friendship, foreign_key: :accepter_id

  before_create do
    self.invite_code = SecureRandom.hex(4);
  end
end
