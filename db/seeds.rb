users = [
  { name: "Cody", email: "cody@squad.com", phone_number: ENV['CODY_NUMBER'], password: "password", password_confirmation: "password"},
  { name: "Chris", email: "chris@squad.com", phone_number: ENV['CHRIS_NUMBER'], password: "password", password_confirmation: "password"},
  { name: "Nick", email: "nick@squad.com", phone_number: '13092223333', password: "password", password_confirmation: "password"},
  { name: "Pavan", email: "pavan@squad.com", phone_number: ENV['PAVAN_NUMBER'], password: "password", password_confirmation: "password"},
  { name: "Gerou", email: "1@squad.com", phone_number: '17736101700', password: "password", password_confirmation: "password"},
  { name: "Karan", email: "2@squad.com", phone_number: '19518807001', password: "password", password_confirmation: "password"},
  { name: "Mike", email: "3@squad.com", phone_number: '18477572877', password: "password", password_confirmation: "password"},
  { name: "Karl", email: "4@squad.com", phone_number: '17144015736', password: "password", password_confirmation: "password"},
  { name: "Chase", email: "5@squad.com", phone_number: '16084387697', password: "password", password_confirmation: "password"},
  { name: "Elsie", email: "6@squad.com", phone_number: '17735766393', password: "password", password_confirmation: "password"},
  { name: "Derek", email: "7@squad.com", phone_number: '17735991519', password: "password", password_confirmation: "password"},
  { name: "Pete", email: "8@squad.com", phone_number: '18132634315', password: "password", password_confirmation: "password"},
  { name: "Al", email: "9@squad.com", phone_number: '12246220547', password: "password", password_confirmation: "password"},
  { name: "Ken", email: "10@squad.com", phone_number: '12242479156', password: "password", password_confirmation: "password"},
  { name: "Ryan", email: "11@squad.com", phone_number: '18476090328', password: "password", password_confirmation: "password"},
  { name: "Savance", email: "12@squad.com", phone_number: '16088864204', password: "password", password_confirmation: "password"},
  { name: "Joel", email: "13@squad.com", phone_number: '17652783818', password: "password", password_confirmation: "password"},
  { name: "Joe", email: "14@squad.com", phone_number: '14104991603', password: "password", password_confirmation: "password"},
  { name: "Dea", email: "15@squad.com", phone_number: '14049736332', password: "password", password_confirmation: "password"},
  { name: "Austin", email: "16@squad.com", phone_number: '12242560645', password: "password", password_confirmation: "password"},
  { name: "Sarah", email: "17@squad.com", phone_number: '12245453339', password: "password", password_confirmation: "password"},
  { name: "JD", email: "18@squad.com", phone_number: '15136009877', password: "password", password_confirmation: "password"},
  { name: "Tyler", email: "19@squad.com", phone_number: '16603411458', password: "password", password_confirmation: "password"},
  { name: "Holly", email: "20@squad.com", phone_number: '13014911017', password: "password", password_confirmation: "password"},
  { name: "Kristen", email: "21@squad.com", phone_number: '17046410399', password: "password", password_confirmation: "password"},
  { name: "Mo", email: "22@squad.com", phone_number: '16164011491', password: "password", password_confirmation: "password"},
  { name: "Tove", email: "23@squad.com", phone_number: '19727412044', password: "password", password_confirmation: "password"},
  { name: "Chris", email: "24@squad.com", phone_number: '17085410176', password: "password", password_confirmation: "password"},
  { name: "Chase", email: "25@squad.com", phone_number: '18156018881', password: "password", password_confirmation: "password"},
  { name: "Nick", email: "26@squad.com", phone_number: '18474215983', password: "password", password_confirmation: "password"},
  { name: "Ashley", email: "27@squad.com", phone_number: '15039993885', password: "password", password_confirmation: "password"},
  { name: "Vadim", email: "28@squad.com", phone_number: '12484443332', password: "password", password_confirmation: "password"}
]

# users = [
#   { name: "Cody", email: "cody@squad.com", phone_number: ENV['CODY_NUMBER'], password: "password", password_confirmation: "password"},
#   { name: "Chris", email: "chris@squad.com", phone_number: ENV['CHRIS_NUMBER'], password: "password", password_confirmation: "password"},
#   { name: "Nick", email: "nick@squad.com", phone_number: '13092223333', password: "password", password_confirmation: "password"},
#   { name: "Pavan", email: "pavan@squad.com", phone_number: ENV['PAVAN_NUMBER'], password: "password", password_confirmation: "password"}
# ]



User.create!(users)

polls = [
  { question: "What do you want for dinner?", expiration: Time.now + 6000, creator_id: 1 },
  { question: "Which baseball team do you like?", expiration: Time.now + 6000, creator_id: 2 },
  { question: "Should I meander to work or take a pewship?", expiration: Time.now + 6000, creator_id: 3 },
  { question: "Have you been to Morocco?", expiration: Time.now + 6000, creator_id: 4 },
  { question: "Who wins in a fight - Hall or Oates?", expiration: Time.now, creator_id: 1, comment: "going with my gut", active?: false }
]

Poll.create!(polls)

polls_array = Poll.all.map { |poll| poll.id }

answers = [
  { text: "Hall", poll_id: polls_array[4], chosen?: true },
  { text: "Oates", poll_id: polls_array[4] },
  { text: "Cubs", poll_id: polls_array[1] },
  { text: "White Sox", poll_id: polls_array[1] },
  { text: "meander", poll_id: polls_array[2] },
  { text: "pewship", poll_id: polls_array[2] },
  { text: "yes", poll_id: polls_array[3] } ,
  { text: "no", poll_id: polls_array[3] },
  { text: "pizza", poll_id: polls_array[0] },
  { text: "lettuce", poll_id: polls_array[0] }
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
  { adder_id: 4, accepter_id: 3, accepted?: true },
  { adder_id: 4, accepter_id: 5, accepted?: true },
  { adder_id: 4, accepter_id: 6, accepted?: true },
  { adder_id: 4, accepter_id: 7, accepted?: true },
  { adder_id: 4, accepter_id: 8, accepted?: true },
  { adder_id: 4, accepter_id: 9, accepted?: true },
  { adder_id: 4, accepter_id: 10, accepted?: true },
  { adder_id: 4, accepter_id: 11, accepted?: true },
  { adder_id: 4, accepter_id: 12, accepted?: true },
  { adder_id: 4, accepter_id: 13, accepted?: true },
  { adder_id: 4, accepter_id: 14, accepted?: true },
  { adder_id: 4, accepter_id: 15, accepted?: true },
  { adder_id: 4, accepter_id: 16, accepted?: true },
  { adder_id: 4, accepter_id: 17, accepted?: true },
  { adder_id: 4, accepter_id: 18, accepted?: true },
  { adder_id: 4, accepter_id: 19, accepted?: true },
  { adder_id: 4, accepter_id: 20, accepted?: true },
  { adder_id: 4, accepter_id: 21, accepted?: true },
  { adder_id: 4, accepter_id: 22, accepted?: true },
  { adder_id: 4, accepter_id: 23, accepted?: true },
  { adder_id: 4, accepter_id: 24, accepted?: true },
  { adder_id: 4, accepter_id: 25, accepted?: true },
  { adder_id: 4, accepter_id: 26, accepted?: true },
  { adder_id: 4, accepter_id: 27, accepted?: true },
  { adder_id: 4, accepter_id: 28, accepted?: true },
  { adder_id: 4, accepter_id: 29, accepted?: true },
  { adder_id: 4, accepter_id: 30, accepted?: true },
  { adder_id: 4, accepter_id: 31, accepted?: true },
  { adder_id: 4, accepter_id: 32, accepted?: true }
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
