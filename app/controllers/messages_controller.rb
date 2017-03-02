class MessagesController < ApplicationController
  #protect_from_forgery with: :null_session

   def reply
    p "****************"
    p "hitting reply route"
    p "****************"
    message_body = params["Body"].split
    from_number = params["From"]
    boot_twilio

    if message_body[0].downcase == "accept"
      friendship = Friendship.find_by(id: message_body[1].to_i)
      friendship.update_attribute(:accepted?, true)
      body = "Thanks for accepting this friend request!"
    elsif message_body[0].downcase == "vote"
      @user = User.find_by(phone_number: params["From"])
      @vote = Vote.new(user_id: @user.id, answer_id: message_body[1].to_i)
      if @vote.save && @user
        body = "Thanks for voting in this poll!"
      elsif @user
        body = "Sorry. You've already voted."
      else
        body = "You need to Squad Up"
      end
    elsif params["Body"] == "yes"
      AudienceVote.create(from: params["From"], yes?: true)
    elsif params["Body"] == "no"
      AudienceVote.create(from: params["From"], yes?: false)
    else
      body = "I don't understand the question, and I won't respond to it."
    end

    sms = @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: from_number,
      body: body
    )
  end

  private

  def boot_twilio
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
