class MessagesController < ApplicationController
  #protect_from_forgery with: :null_session

   def reply
    message_body = params["Body"].split
    from_number = params["From"]
    boot_twilio

    if message_body[0].downcase == "accept"
      friendship = Friendship.find_by(id: message_body[1].to_i)
      friendship.update_attribute(:accepted?, true)
      user = User.find_by(id: friendship.accepter_id)
      body = "Thanks for accepting this friend request! Register and make your own polls at https://dbc-squad.herokuapp.com/#{user.invite_code}"
    elsif message_body[0].downcase == "vote"
      @user = User.find_by(phone_number: params["From"])
      @vote = Vote.new(user_id: @user.id, answer_id: message_body[1].to_i)
      if @vote.save && @user
        body = "Thanks for voting in this poll! Go see the results at https://dbc-squad.herokuapp.com"
      elsif @user
        body = "Sorry. You've already voted."
      else
        body = "You need to Squad Up"
      end
    else
      body = "I don't quite understand..."
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
