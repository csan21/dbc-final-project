users = [
  { name: "Cody", email: "cody@squad.com", phone_number: ENV['CODY_NUMBER'], password: "password", password_confirmation: "password"},
  { name: "Chris", email: "chris@squad.com", phone_number: ENV['CHRIS_NUMBER'], password: "password", password_confirmation: "password"},
  { name: "Nick", email: "nick@squad.com", phone_number: '13092223333', password: "password", password_confirmation: "password"},
  { name: "Pavan", email: "pavan@squad.com", phone_number: ENV['PAVAN_NUMBER'], password: "password", password_confirmation: "password"}
]

User.create!(users)

polls = [
  { question: "Question one", expiration: Time.now.tomorrow, creator_id: 1 },
  { question: "Question two", expiration: Time.now.tomorrow, creator_id: 2 },
  { question: "Question three", expiration: Time.now.tomorrow, creator_id: 3 },
  { question: "Question four", expiration: Time.now.tomorrow, creator_id: 4 },
  { question: "Question five", expiration: Time.now, creator_id: 1, comment: "going with my gut", active?: false }
]

Poll.create!(polls)

polls_array = Poll.all.map { |poll| poll.id }

answers = [
  { text: "yes", poll_id: polls_array[4], chosen?: true },
  { text: "no", poll_id: polls_array[4] },
  { text: "yes", poll_id: polls_array[1] },
  { text: "no", poll_id: polls_array[1] },
  { text: "yes", poll_id: polls_array[2] },
  { text: "no", poll_id: polls_array[2] },
  { text: "yes", poll_id: polls_array[3] } ,
  { text: "no", poll_id: polls_array[3] },
  { text: "yes", poll_id: polls_array[0] },
  { text: "no", poll_id: polls_array[0] }
]

Answer.create!(answers)

friends = [
  { adder_id: 1, accepter_id: 2, accepted?: true },
  { adder_id: 1, accepter_id: 3, accepted?: true },
  { adder_id: 1, accepter_id: 4, accepted?: false },
  { adder_id: 2, accepter_id: 1, accepted?: false },
  { adder_id: 2, accepter_id: 3, accepted?: true },
  { adder_id: 2, accepter_id: 4, accepted?: true },
  { adder_id: 3, accepter_id: 2, accepted?: false },
  { adder_id: 3, accepter_id: 1, accepted?: true },
  { adder_id: 3, accepter_id: 4, accepted?: true },
  { adder_id: 4, accepter_id: 2, accepted?: true },
  { adder_id: 4, accepter_id: 1, accepted?: true },
  { adder_id: 4, accepter_id: 3, accepted?: false }
]

Friendship.create!(friends)

votes = [
  { user_id: 1, answer_id: 3 },
  { user_id: 1, answer_id: 7 },
  { user_id: 2, answer_id: 2 },
  { user_id: 2, answer_id: 8 },
  { user_id: 3, answer_id: 1 },
  { user_id: 3, answer_id: 4 },
  { user_id: 4, answer_id: 9 }
]

Vote.create!(votes)
