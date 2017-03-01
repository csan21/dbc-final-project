class PollsController < ApplicationController
  #skip_before_filter :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"

  def show
    @poll = Poll.find(params[:id])
    @time_left = Time.at(@poll.expiration - Time.now).utc.strftime("%H hours, %M minutes, %S seconds")

    if request.xhr?
      render partial: 'polls/poll_votes', layout: false, locals: {poll: @poll}
    end
  end

  def index
    redirect_to new_user_poll_path
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



    # Hack to tie answers to poll
    @poll.answers.each do |a|
      a.poll = @poll
    end

    if @poll.save

      current_user.friends_who_have_accepted.each do |friend|
        solicit_vote(friend.phone_number, @poll)
      end

      redirect_to "/users/#{current_user.id}/polls/#{@poll.id}"
    else
      render :new
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

  def expiration
    @poll = Poll.find(params[:id])
    render json: @poll.expiration.to_json
  end


  def poll_params
    params.require(:poll).permit(:question, :expiration, :image, answers_attributes: [:text])
  end
end
