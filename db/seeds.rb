# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Conversation.destroy_all
Language.destroy_all
Correspondance.destroy_all
User.destroy_all
City.destroy_all


City.create(name: "Barcelone", country: "Spain", zip_code: "08001")
City.create(name: "Berlin", country: "Germany", zip_code: "10115")
City.create(name: "London", country: "England", zip_code: "")
City.create(name: "Lisbon", country: "Portugal", zip_code: "1000")
City.create(name: "Copenhagen", country: "Denmark", zip_code: "1050")
City.create(name: "Prague", country: "Czech Republic", zip_code: "100 00")
City.create(name: "Budapest", country: "Hungary", zip_code: "1007")
City.create(name: "Paris", country: "France", zip_code: "75000")
City.create(name: "Roma", country: "Italy", zip_code: "00100")
City.create(name: "Madrid", country: "Spain", zip_code: "28001")

Language.create(language: "Spanish")
Language.create(language: "German")
Language.create(language: "English")
Language.create(language: "Portuguese")
Language.create(language: "Czech")
Language.create(language: "Danish")
Language.create(language: "French")
Language.create(language: "Italian")
Language.create(language: "Hungarian")
Language.create(language: "Norwegian")
puts "language created"




10.times do
  i = [1,2,4,7,9,10].sample
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars, age: (rand(15)+20), email: "#{Faker::Name.unique.first_name}@yopmail.com", password: "123456", city_id: City.all.sample.id )
  user.avatar.attach(io: File.open("app/assets/images/img/user-#{i}.jpg"), filename:"user-#{i}.jpg")
end
user = User.create!(first_name: "user", last_name: "family", description: Faker::Lorem.paragraph_by_chars, age: (rand(15)+20), email: "user@yopmail.com", password: "123456", city_id: City.all.sample.id )
user.avatar.attach(io: File.open("app/assets/images/img/user-1.jpg"), filename:"user-1.jpg")

puts "User created"

users=  User.all
users.each do |u|
  users_except = users.reject{|us| us == u}
  5.times do
    receiver = users_except.sample
    Conversation.create!(author: u, receiver: receiver)
    users_except = users_except.reject{|us| us == receiver}
  end
end
puts "Conversation created"

conversations = Conversation.all
conversations.each do |conv|
  10.times do
    Message.create!(user: conv.participants.sample, conversation: conv, content: Faker::Lorem.paragraph_by_chars )
  end
end 
puts "Message created"

75.times do
  correspondance = Correspondance.create!(user_one: User.all.sample, user_two: User.all.sample)
end

puts "Seeding done"
