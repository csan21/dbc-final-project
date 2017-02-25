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
