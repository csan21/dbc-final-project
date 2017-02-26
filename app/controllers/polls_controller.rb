class PollsController < ApplicationController
  skip_before_filter :verify_authenticity_token
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
      creator_id: 1
    )
    Answer.create(text: params["answer1"], poll_id: @poll.id)
    Answer.create(text: params["answer2"], poll_id: @poll.id)

    redirect_to "/users/1"
  end
end
