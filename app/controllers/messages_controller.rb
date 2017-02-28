class MessagesController < ApplicationController
  #protect_from_forgery with: :null_session

   def reply
    message_body = params["Body"].split
    from_number = params["From"]
    boot_twilio

    if message_body[0] == "accept"
      friendship = Friendship.find_by(id: message_body[1].to_i)
      p "**************"
      p friendship
      friendship.update_attribute(:accepted?, true)
      p "******updated friendship"
      p friendship
      body = "Thanks for accepting this friend request!"
    elsif message_body[0] == "vote"
      user = User.find_by(phone_number: params["From"])
      Vote.create(user_id: user.id, answer_id: message_body[1].to_i)
      body = "Thanks for voting in this poll!"
    end

    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
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
