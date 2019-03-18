# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def get_random_image
  image_path_prefix = "app/assets/images/img/"
  image_files = Dir.glob("#{image_path_prefix}*")
  image_select = image_files.sample
  [image_select, image_select.split(image_path_prefix)[1]]
end

UserLanguage.destroy_all
Flat.destroy_all
Message.destroy_all
Conversation.destroy_all
Language.destroy_all
Correspondance.destroy_all
User.destroy_all
City.destroy_all


barcelone = City.create!(name: "Barcelone", country: "Spain", zip_code: "08001")
puts "Barcelone created"
berlin = City.create!(name: "Berlin", country: "Germany", zip_code: "10115")
puts "Berlin created"
london =  City.create!(name: "London", country: "England", zip_code: "WC2N 5DU")
puts "London created"
lisbon = City.create!(name: "Lisbon", country: "Portugal", zip_code: "1000")
puts "Lisbon created"
copenhagen =City.create!(name: "Copenhagen", country: "Denmark", zip_code: "1050")
puts "Copenhagen created"
prague = City.create!(name: "Prague", country: "Czech Republic", zip_code: "100 00")
puts "Prague created"
budapest = City.create!(name: "Budapest", country: "Hungary", zip_code: "1007")
puts "Budapest created"
paris = City.create!(name: "Paris", country: "France", zip_code: "75000")
puts "Paris created"
roma = City.create!(name: "Roma", country: "Italy", zip_code: "00100")
puts "Roma created"
madrid = City.create!(name: "Madrid", country: "Spain", zip_code: "28001")
puts "Madrid created"

barcelone.picture.attach(io: File.open("app/assets/images/cities/barcelone.jpg"), filename:"barcelone.jpg")
berlin.picture.attach(io: File.open("app/assets/images/cities/berlin.jpg"), filename:"berlin.jpg")
london.picture.attach(io: File.open("app/assets/images/cities/london.jpg"), filename:"london.jpg")
lisbon.picture.attach(io: File.open("app/assets/images/cities/lisbon.jpg"), filename:"lisbon.jpg")
copenhagen.picture.attach(io: File.open("app/assets/images/cities/copenhagen.jpg"), filename:"copenhagen.jpg")
prague.picture.attach(io: File.open("app/assets/images/cities/prague.jpg"), filename:"prague.jpg")
budapest.picture.attach(io: File.open("app/assets/images/cities/budapest.jpg"), filename:"budapest.jpg")
paris.picture.attach(io: File.open("app/assets/images/cities/paris.jpg"), filename:"paris.jpg")
roma.picture.attach(io: File.open("app/assets/images/cities/roma.jpg"), filename:"roma.jpg")
madrid.picture.attach(io: File.open("app/assets/images/cities/madrid.jpg"), filename:"madrid.jpg")

sp = Language.create!(language: "Spanish")
sp.icon.attach(io: File.open("app/assets/images/flag/espagne.png"), filename:"espagne.png")

sp = Language.create!(language: "German")
sp.icon.attach(io: File.open("app/assets/images/flag/allemagne.png"), filename:"allemagne.png")

sp = Language.create!(language: "English")
sp.icon.attach(io: File.open("app/assets/images/flag/english.png"), filename:"english.png")

sp = Language.create!(language: "Portuguese")
sp.icon.attach(io: File.open("app/assets/images/flag/portugal.png"), filename:"portugal.png")

sp = Language.create!(language: "Czech")
sp.icon.attach(io: File.open("app/assets/images/flag/republique_tcheque.png"), filename:"republique_tcheque.png")

sp = Language.create!(language: "Dutch")
sp.icon.attach(io: File.open("app/assets/images/flag/hollande.png"), filename:"hollande.png")

sp = Language.create!(language: "French")
sp.icon.attach(io: File.open("app/assets/images/flag/france.png"), filename:"france.png")

sp = Language.create!(language: "Italian")
sp.icon.attach(io: File.open("app/assets/images/flag/italie.png"), filename:"italie.png")

sp = Language.create!(language: "Hungarian")
sp.icon.attach(io: File.open("app/assets/images/flag/hongrie.png"), filename:"hongrie.png")

sp = Language.create!(language: "Norwegian")
sp.icon.attach(io: File.open("app/assets/images/flag/norvege.png"), filename:"norvege.png")

puts "language created"




30.times do
  img = get_random_image
  i = [1,2,4,7,9,10].sample
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.unique.last_name, description: Faker::Lorem.paragraph_by_chars, age: (rand(15)+20), email: "#{Faker::Name.unique.first_name}@yopmail.com", password: "123456", city_id: City.all.sample.id )
  user.avatar.attach(io: File.open(img[0]), filename: img[1])
end
img = get_random_image
user = User.create!(first_name: "user", last_name: "family", description: Faker::Lorem.paragraph_by_chars, age: (rand(15)+20), email: "user@yopmail.com", password: "123456", city_id: City.all.sample.id )
user.avatar.attach(io: File.open(img[0]), filename: img[1])

puts "User created"


users=  User.all
users.each do |u|
  languages = Language.all
  rand(1..4).times do
    l = languages.sample
    u.languages << l
    languages.reject{|la| la == l}
  end

end
#   users_except = users.reject{|us| us == u}
#   2.times do
#     receiver = users_except.sample
#     c = Conversation.new(author: u, receiver: receiver)
#     unless Conversation.find_by(author: receiver,receiver: u)
#       c.save!
#     end
#     users_except = users_except.reject{|us| us == receiver}
#   end
# end

puts "language association created"


users=  User.all
150.times do
  status = ["waiting", "refused", "validated"].sample
  u1 =  users.sample
  u2 = users.reject{|us| us == u1}.sample
  correspondance = Correspondance.new(creator: u1, acceptor: u2, status: status, message: Faker::Lorem.sentence)
  unless Correspondance.already_contain?(correspondance)
    correspondance.save!
    if status == "validated"
      Conversation.create!(author: u1, receiver: u2)
    end
  end
end
puts "correspondance created"

puts "Conversation created"

conversations = Conversation.all
conversations.each do |conv|
  10.times do
    Message.create!(user: conv.participants.sample, conversation: conv, content: Faker::Lorem.sentence )
  end
end
puts "Message created"

users=  User.all
User.all.each do |u|
  users_except = users.reject{|us| us == u}
  rand(5).times do
    receiver = users_except.sample
    Comment.create!(content: Faker::Lorem.sentence, author: u, receiver: receiver)
    users_except = users_except.reject{|us| us == receiver}
  end
end
puts "comment created"


10.times do
  img = get_random_image
  i = [1,2,4,7,9,10].sample
  flat = Flat.create!(user_id: User.all.sample.id, description: Faker::Lorem.paragraph_by_chars, address: Faker::Address.street_address)
  flat.main_picture.attach(io: File.open(img[0]), filename: img[1])
  img = get_random_image
  flat.other_pictures.attach(io: File.open(img[0]), filename: img[1])
  img = get_random_image
  flat.other_pictures.attach(io: File.open(img[0]), filename: img[1])
end
puts "Flat created"

puts "Seeding done"
