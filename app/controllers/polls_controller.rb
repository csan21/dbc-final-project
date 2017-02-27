class PollsController < ApplicationController
  #skip_before_filter :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"

  def show
    @poll = Poll.find(params[:id])
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.create(
      question: params["question"],
      expiration: Time.now + params["expiration"].to_i,
      creator_id: session[:user_id]
    )
    Answer.create(text: params["answer1"], poll_id: @poll.id)
    Answer.create(text: params["answer2"], poll_id: @poll.id)

    current_user.friends_who_have_accepted.each do |friend|
      if friend.phone_number == "13093379871"
        solicit_vote(friend.phone_number, @poll)
      end
    end

    redirect_to "/users/#{current_user.id}"
  end

  def edit
    @poll = Poll.find_by(id: params["id"])
  end

  def update
    @answer = Answer.find_by(id: params["chosen_answer"].to_i)
    @answer.update_attribute(:chosen?, true)
    @poll = Poll.find_by(id: params["id"])
    @poll.update_attribute(:active?, false)
    @poll.update_attribute(:comment, params["comment"])

    redirect_to "/users/#{current_user.id}"
  end
end
