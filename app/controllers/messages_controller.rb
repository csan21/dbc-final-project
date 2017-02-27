class MessagesController < ApplicationController
  protect_from_forgery with: :null_session

   def reply
    message_body = params["Body"].split
    from_number = params["From"]

    puts "\n" * 20
    p message_body
    puts "\n" * 20

    if message_body[0] == "accept"
      friendship = Friendship.find_by(id: message_body[1].to_i)
      friendship.update_attribute(:accepted?, true)
    end

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
    auth_token = '0bed38afc3fd8255de8263575e9d83b2'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end

# ENV["TWILIO_TOKEN"]
