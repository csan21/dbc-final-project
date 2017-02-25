# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  { name: "Cody", email: "cody@squad.com", phone_number: ENV['CODY_NUMBER'], password: "password", password_confirmation: "password"},
  { name: "Chris", email: "chris@squad.com", phone_number: ENV['CHRIS_NUMBER'], password: "password", password_confirmation: "password"},
  { name: "Nick", email: "nick@squad.com", phone_number: ENV['NICK_NUMBER'], password: "password", password_confirmation: "password"},
  { name: "Pavan", email: "pavan@squad.com", phone_number: ENV['PAVAN_NUMBER'], password: "password", password_confirmation: "password"}
]

User.create!(users)

users_array = User.all.map { |user| user.id }


polls = [
  { question: "Question one", expiration: Time.now.tomorrow, creator_id: users_array.sample },
  { question: "Question two", expiration: Time.now.tomorrow, creator_id: users_array.sample },
  { question: "Question three", expiration: Time.now.tomorrow, creator_id: users_array.sample },
  { question: "Question four", expiration: Time.now.tomorrow, creator_id: users_array.sample },
  { question: "Question five", expiration: Time.now, creator_id: users_array.sample, comment: "going with my gut", active?: false }
]

Poll.create!(polls)

polls_array = Poll.all.map { |poll| poll.id }

answers = [
  { text: "yes", poll_id: Poll.last.id, chosen?: true },
  { text: "no", poll_id: Poll.last.id },
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
