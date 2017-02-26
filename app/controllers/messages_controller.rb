class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"

   def reply
    message_body = params["Body"]
    from_number = params["From"]

    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: from_number,
      body: "I received the following message: #{message_body}"
    )
  end

  private

  def boot_twilio
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
