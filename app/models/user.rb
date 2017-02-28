class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token
  before_save   :downcase_email
  before_save   :add_plus_to_phone_number
  before_create :generate_access_token

  has_many :created_polls, class_name: :Poll, foreign_key: :creator_id
  has_many :votes
  has_many :chosen_answers, through: :votes, source: :answer
  has_many :squad_members, class_name: :Friendship, foreign_key: :adder_id
  has_many :squad_memberships, class_name: :Friendship, foreign_key: :accepter_id
  has_many :squad_membership_users, through: :squad_memberships, source: :adder
  has_many :squad_member_users, through: :squad_members, source: :accepter

  validates_presence_of :name, :email, :phone_number, :password, :password_confirmation
  validates_uniqueness_of :email, :phone_number

  before_create do
    self.invite_code = SecureRandom.hex(4);
  end

  has_secure_password

  def sorted_created_current_polls
    my_polls = self.created_polls.select { |poll| poll.current? }
    my_polls.sort_by { |poll| poll.created_at }.reverse
  end

  def friends_who_have_accepted
    my_friendships = self.squad_members.where(accepted?: true)
    my_friendships.map { |friendship| friendship.accepter }
  end

  def incoming_friend_requests
    self.squad_memberships.where(accepted?: false)
  end

  def polls_to_answer
    polls_to_answer = []
    squad_membership_users.each do |user|
      user.created_polls.each do |poll|
        if poll.current?
          polls_to_answer << poll
        end
      end
    end
    return polls_to_answer - self.taken_polls
  end

  def sorted_created_old_polls
    my_polls = self.created_polls.select { |poll| poll.current? == false }
    my_polls.sort_by { |poll| poll.created_at }.reverse
  end

  def taken_polls
    self.chosen_answers.map { |answer| answer.poll }
  end

   def recent_taken_polls
    self.taken_polls.select { |poll| poll.created_at > 1.day.ago}
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    def add_plus_to_phone_number
      if phone_number[0] != "+"
        self.phone_number = "+" + phone_number
      end
    end

    def generate_access_token
      begin
        self.access_token = User.new_token
      end while self.class.exists?(access_token: access_token)
    end
end
