module MessagesHelper

  def friend_add(number)
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: number,
      body: "#{current_user.name} wants to be your friend on Squad! Reply 'accept 16' to accept."
    )
  end

  private
  def boot_twilio
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
