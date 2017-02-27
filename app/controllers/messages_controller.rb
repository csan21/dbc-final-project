class MessagesController < ApplicationController

   def reply
    message_body = params["Body"]
    from_number = params["From"]

    # if message_body[0] == "accept"
    #   friendship = Friendship.find_by(id: message_body[1])
    #   friendship.update_attribute(accepted?: true)
    # end

    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: from_number,
      body: "Thanks for accepting this friend request!"
    )
  end

  private

  def boot_twilio
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
