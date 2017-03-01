class PollsController < ApplicationController
  #skip_before_filter :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"

  def show
    @poll = Poll.find(params[:id])

    if request.xhr?
      render partial: 'polls/poll_votes', layout: false, locals: {poll: @poll}
    end
  end

  def new
    # Create poll with 2 answer options
    @poll = Poll.new
    @poll.answers.build({text: 'Yes'})
    @poll.answers.build({text: 'No'})
  end

  def create
    pp = poll_params
    pp['expiration'] = Time.now + pp['expiration'].to_i
    @poll = current_user.created_polls.new(pp)

    current_user.friends_who_have_accepted.each do |friend|
      if friend.phone_number == "+13093379871"
        solicit_vote(friend.phone_number, @poll)
      end
    end

    # Hack to tie answers to poll
    @poll.answers.each do |a|
      a.poll = @poll
    end

    if @poll.save
      redirect_to "/users/#{current_user.id}/polls/#{@poll.id}"
    else
      render action: 'new'
    end
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

  def poll_params
    params.require(:poll).permit(:question, :expiration, :image, answers_attributes: [:text])
  end
end
