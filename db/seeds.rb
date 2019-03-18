# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Quiz.create( question:"Did you had a pet when you where a child?", level:1)
Quiz.create( question:"Where did you grow up?", level:1)
Quiz.create( question:"If you could take a plane tomorrow to go anywhere, what would be your destination?", level:1)
Quiz.create( question:"How many brothers and sisters do you have?", level:1)
Quiz.create( question:"What is your favorite movie?", level:1)
Quiz.create( question:"What is your favorite book?", level:1)
Quiz.create( question:"Did you recently go somewhere for the first of your life?", level:1)
Quiz.create( question:"What was your favorite music band back in your teenage years ?", level:1)
Quiz.create( question:"How do you like your eggs?", level:1)
Quiz.create( question:"Do you have a collection of some kind?", level:1)
Quiz.create( question:"What was your first job?", level:1)
Quiz.create( question:"What is your favorite song ?", level:1)
Quiz.create( question:"What is your favorite color ?", level:1)
Quiz.create( question:"What is your parents name?", level:1)
Quiz.create( question:"What is your favorite dish?", level:1)
Quiz.create( question:"What is your favorite season?", level:1)
Quiz.create( question:"Tell 2 fact about you and one lie, lets see if the other can find out", level:1)
Quiz.create( question:"If you were a vegetable what would it be ?", level:1)
Quiz.create( question:"What is your job?", level:1)


Quiz.create( question:"What is your favorite family tradition?", level:2)
Quiz.create( question:"What would be a perfect saturday night?", level:2)
Quiz.create( question:"Do you have any phobia?", level:2)
Quiz.create( question:"What make you the most proud in your life?", level:2)
Quiz.create( question:"Do you have a favorite quote?", level:2)
Quiz.create( question:"What is your plan for tonight?", level:2)
Quiz.create( question:"What is your plan for tomorrow?", level:2)
Quiz.create( question:"Which travel you did, left you with the most pleasant memories?", level:2)
Quiz.create( question:"Do you drink alcohol ? If the answer is yes tell your best drinking story", level:2)
Quiz.create( question:"Do you drink alcohol ? If the answer is yes tell the worst thing that happen when you were drunk?", level:2)
Quiz.create( question:"What did you do with your first pay?", level:2)
Quiz.create( question:"Have you been injured by a wild animal in your life? How?", level:2)
Quiz.create( question:"If you could give life to any fictive character who would you choose?", level:2)
Quiz.create( question:'What do you regret from "the good old time?"', level:2)
Quiz.create( question:"Tomorrow you wake up as an animal, which is it and why?", level:2)
Quiz.create( question:"Which character in a movie would you like be in real life?", level:2)
Quiz.create( question:"If you had to create a  tagline for your life what would it be?", level:2)
Quiz.create( question:"What did you do yesterday?", level:2)
Quiz.create( question:"What is the funniest thing that happened to you?", level:2)
Quiz.create( question:"Are you naturally gifted for something useless ?", level:2)
Quiz.create( question:"How long was your longest relation with someone?", level:2)
Quiz.create( question:"What is the biggest injury you ever had?", level:2)
Quiz.create( question:"With which celebrity you would spend your life?", level:2)
Quiz.create( question:"Have you ever got so drunk that you slept in the toilets ? if yes how and why?", level:2)
Quiz.create( question:"What is the most dangerous thing you ever did?", level:2)
Quiz.create( question:"What is your ultimate goal in life ?", level:2)
Quiz.create( question:"tell a joke", level:2)
Quiz.create( question:"You have to choose a spirit animal, which is it and why?", level:2)
Quiz.create( question:"What do you like the most about you?", level:2)


Quiz.create( question:"Have you ever commited any crime ? (even small ones)", level:3)
Quiz.create( question:"Did you tried drugs? Which one ?", level:3)
Quiz.create( question:"When did you do your first time ?And tell what went wrong (Because every first time meet some problems along the ride)", level:3)
Quiz.create( question:"What is the worst thing you did to anyone?", level:3)
Quiz.create( question:"What is your worst sex story ever ?", level:3)
Quiz.create( question:"What is the last incredibly dumb thing you did?", level:3)
Quiz.create( question:"Have you ever been unfaithful?", level:3)
Quiz.create( question:"What is your deepest secret ?", level:3)
Quiz.create( question:"Did you ever got injuries from sex ?", level:3)
Quiz.create( question:"With which celebrity you would spend the night?", level:3)
Quiz.create( question:"What is your worst nightmare ?", level:3)
Quiz.create( question:"What is the most insane thing you ever seen ?", level:3)
Quiz.create( question:"What is the most embarassing  situation you could put your self through for a prize of 1 million dollars?", level:3)
Quiz.create( question:"Do you have a secret dream?", level:3)
Quiz.create( question:"What is the most incredible thing you ever did? (You are allowed to brag but not too much)", level:3)
Quiz.create( question:"What is the meaning of life ? (exept for the answer : 42)", level:3)
Quiz.create( question:"Who was the most insane person you ever know and why?", level:3)
Quiz.create( question:"Which movie make you cry every single time and which part of this movie?", level:3)
Quiz.create( question:"If you add to choose one : sex or food ?", level:3)

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
