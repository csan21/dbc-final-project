class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_polls, class_name: :Poll, foreign_key: :creator_id
  has_many :votes
  has_many :chosen_answers, through: :votes, source: :answer
  has_many :taken_polls, through: :chosen_answers, source: :poll
  has_many :squad_members, class_name: :Friendship, foreign_key: :adder_id
  has_many :squad_memberships, class_name: :Friendship, foreign_key: :accepter_id
  has_many :squad_membership_users, through: :squad_memberships, source: :adder

  before_create do
    self.invite_code = SecureRandom.hex(4);
  end

  def sorted_created_polls
    Poll.where(creator_id: self.id).order(created_at: :desc)
  end

  def polls_to_answer
    polls_to_answer = []

    p "*" * 50
    p self.squad_memberships
    p "*" * 50

    self.squad_membership_users.each do |user|
      user.created_polls.each do |poll|
        if poll.active?
          polls_to_answer << poll
        end
      end
    end

    return polls_to_answer
  end

end
