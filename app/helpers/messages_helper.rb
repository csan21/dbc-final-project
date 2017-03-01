module MessagesHelper

  def friend_add(number, friendship_id)
    boot_twilio
    sms = @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: number,
      body: "#{current_user.name} wants to be your friend on Squad! Reply 'accept #{friendship_id}' to accept."
    )
  end

  def solicit_vote(number, poll)
    p "****************"
    p poll.answers
    p "*****************"
    boot_twilio
    sms = @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: number,
      body: "#{current_user.name} asked: #{poll.question} Reply 'vote #{poll.answers[0].id}' to vote for #{poll.answers[0].text} or 'vote #{poll.answers[1].id}' to vote for #{poll.answers[1].text}."
    )
  end

  private
  def boot_twilio
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
