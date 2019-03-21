# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def get_random_image_avatar
  image_path_prefix = "app/assets/images/img/avatar/"
  image_files = Dir.glob("#{image_path_prefix}*")
  image_select = image_files.sample
  [image_select, image_select.split(image_path_prefix)[1]]
end
def get_random_image_flat
  image_path_prefix = "app/assets/images/img/flat/"
  image_files = Dir.glob("#{image_path_prefix}*")
  image_select = image_files.sample
  [image_select, image_select.split(image_path_prefix)[1]]
end

def get_random_image_user
  image_path_prefix = "app/assets/images/img/user_picture/"
  image_files = Dir.glob("#{image_path_prefix}*")
  image_select = image_files.sample
  [image_select, image_select.split(image_path_prefix)[1]]
end



Preference.destroy_all
Answer.destroy_all
Quiz.destroy_all
UserLanguage.destroy_all
Flat.destroy_all
Message.destroy_all
Conversation.destroy_all
Language.destroy_all
Correspondance.destroy_all
User.destroy_all
City.destroy_all
UserPreference.destroy_all

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

puts "Quiz create"

barcelone = City.create!(name: "Barcelone", country: "Spain", zip_code: "08001", description: "Allow me to state here how much I love Barcelona , an admirable city, a city full of life, intense, a port open to the past and future.  Le Corbusier")
puts "Barcelone created"
berlin = City.create!(name: "Berlin", country: "Germany", zip_code: "10115", description: "The city of creation: Mode, Art, Design, Music. All free men, wherever they may live, are citizens of Berlin. And therefore, as a free man, I take pride in the words, ‘Ich bin ein Berliner! John Kennedy ")
puts "Berlin created"
london =  City.create!(name: "London", country: "England", zip_code: "WC2N 5DU", description: "when a man is tired of London, he is tired of life. Samuel Johnson")
puts "London created"
lisbon = City.create!(name: "Lisbon", country: "Portugal", zip_code: "1000", description: "“By day Lisbon has a naive theatrical quality that enchants and captivates, but by night it is a fairy-tale city, descending over lighted terraces to the sea, like a woman in festive garments going down to meet her dark lover.” Erich Maria Remarque")
puts "Lisbon created"
copenhagen =City.create!(name: "Copenhagen", country: "Denmark", zip_code: "1050", description: "The city somehow manages to combine a very zippy vibe, thanks to its cultural and nightlife offerings, with a holiday-resort-style chill, due to its small size and some of the most laid-back people you’re likely to meet.")
puts "Copenhagen created"
prague = City.create!(name: "Prague", country: "Czech Republic", zip_code: "100 00", description: "Prague is a living and breathing enigma; old and dirty but somehow unimaginably graceful. And the Beer? The best of Europe for 50 cent.")
puts "Prague created"
budapest = City.create!(name: "Budapest", country: "Hungary", zip_code: "1007", description: "In Budapest, you’ll find experiences like nothing else in Europe: Feel your stress ebb away as you soak in hundred-degree water, surrounded by opulent Baroque domes…and by Speedo- and bikini-clad Hungarians. Ogle some of Europe’s most richly decorated interiors, which echo a proud little nation’s bygone glory days. Rick Steves")
puts "Budapest created"
paris = City.create!(name: "Paris", country: "France", zip_code: "75000", description: "A walk about Paris will provide lessons in history, beauty, and in the point of Life. -Thomas Jefferson")
puts "Paris created"
roma = City.create!(name: "Roma", country: "Italy", zip_code: "00100", description: "The beauty of the Eternal City, the chaos, the mismatch of elegance and decay that is around every corner. If we could be reborn wherever we chose, how crowded Rome would be.")
puts "Roma created"
madrid = City.create!(name: "Madrid", country: "Spain", zip_code: "28001",  description: "God worked six days, and rested on the seventh: Madrilenos rest the six,and on the seventh... go to the bullfight. H O'Shea")
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

Preference.create!(description: "Have some drink till the dawn")
Preference.create!(description: "Meet friends of my Host")
Preference.create!(description: "Dance all night long with electronic music")
Preference.create!(description: "Running in the city")
Preference.create!(description: "Visit Museum")
Preference.create!(description: "Typical local Restaurant")
Preference.create!(description: "Visit museum")
Preference.create!(description: "Play music in da street")
Preference.create!(description: "Concert with local music")
Preference.create!(description: "Chilling in a parc")
Preference.create!(description: "Smoking salad")
Preference.create!(description: "Skating the city")
Preference.create!(description: "Biking the city")
Preference.create!(description: "Just walking and seeing the culture")
Preference.create!(description: "Less than 100€ ")
Preference.create!(description: "Between 100€ and 200€")
Preference.create!(description: "I don't care till i'm having fun")

puts "preferences created"

300.times do
  img = get_random_image_avatar
  i = [1,2,4,7,9,10].sample

  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.unique.last_name, description: Faker::Lorem.paragraph_by_chars, age: (rand(15)+20), email: "#{Faker::Name.unique.first_name}@yopmail.com", password: "123456", city_id: City.all.sample.id, welcome_message: Faker::Lorem.sentence, nationality: Faker::Nation.nationality )

  user.avatar.attach(io: File.open(img[0]), filename: img[1])
  3.times do
    img = get_random_image_user
    user.pictures.attach(io: File.open(img[0]), filename: img[1])
  end

end
img = get_random_image_avatar
user = User.create!(first_name: "jean", last_name: "effe", description: Faker::Lorem.paragraph_by_chars, age: (rand(15)+20), email: "user1@yopmail.com", password: "123456", city_id: City.all.sample.id, welcome_message: Faker::Lorem.sentence, nationality: Faker::Nation.nationality )
user.avatar.attach(io: File.open(img[0]), filename: img[1])
3.times do
  img = get_random_image_user
  user.pictures.attach(io: File.open(img[0]), filename: img[1])
end

img = get_random_image_avatar
user = User.create!(first_name: "flo", last_name: "bobo", description: Faker::Lorem.paragraph_by_chars, age: (rand(15)+20), email: "user2@yopmail.com", password: "123456", city_id: City.all.sample.id, welcome_message: Faker::Lorem.sentence, nationality: Faker::Nation.nationality )
user.pictures.attach(io: File.open(img[0]), filename: img[1])
3.times do
  img = get_random_image_user
  user.pictures.attach(io: File.open(img[0]), filename: img[1])
end


puts "User created"


User.all.each do |u|
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


User.all.each do |u|
  pref_except = Preference.all
  1.upto(5) do |i|
    p = pref_except.sample
    userpreferences = UserPreference.new(user: u, preference: p, position: i)
    userpreferences.save!
    pref_except = pref_except.reject{|pref| pref == p}
  end
end
#   arraystock = []
#   u.user_preferences.each do |f|
#     arraystock << f
#   end
#   u.user_preferences.each do |x|
#     while x == arraystock[0] || arraystock[1] || arraystock[2] || arraystock[3] || arraystock[4]
#       x = preferences.uniq.sample
#       x.save!
#     end
#   end
# end

# arraystock = []
# iteratordemerde = 0
# preferences = Preference.all
# 5.times do
#   p = preferences.sample
#   arraystock << p
# end
#
# User.all.each do |u|
#   arraystock.each do |z,index|
#     if index == 0
#       first = z
#     elsif index == 1
#       second = z
#     elsif index == 2
#       third == z
#     elsif index == 3
#       fourth == z
#     elsif index == 4
#       fifth == z
#       while first == second || first == third || first == fourth || first == fifth || second == third || second == fourth || second == fifth || third == fourth || third == fifth || fourth == fifth
#         if first.id == z.id
#           first = p
#         end
#         if second.id == z.id
#           second = p
#         end
#         if third.id == z.id
#           third = p
#         end
#         if fourth.id == z.id
#           fourth = p
#         end
#         if fifth.id == z.id
#           fifth = p
#         end
#         arraystock[0] = first
#         arraystock[1] = second
#         arraystock[2] = third
#         arraystock[3] = fourth
#         arraystock[4] = fifth
#       end
#     end
#   end
#   arraystock.each do |f|
#     userpreferences = UserPreference.new(user: u, preference: f, position: rand(1..5))
#     userpreferences.save!
#   end
# end


puts "preference association created"


users=  User.all
150.times do
  status = ["waiting", "refused", "validated"].sample
  u1 =  users.sample
  u2 = users.reject{|us| us == u1}.sample
  correspondance = Correspondance.new(creator: u1, acceptor: u2, status: status, message: Faker::Lorem.sentence)
  unless Correspondance.already_contain?(correspondance)
    correspondance.save!
    if status == "validated"
      conv = Conversation.create!(author: u1, receiver: u2)
      quizs = Quiz.all
      i = 0
      quizs.level1.sample(5).each do |quiz|
        QuizConv.create!(conversation: conv, quiz: quiz, index:i)
        i += 1
      end
      quizs.level2.sample(5).each do |quiz|
        QuizConv.create!(conversation: conv, quiz: quiz, index:i)
        i += 1
      end
      quizs.level3.sample(5).each do |quiz|
        QuizConv.create!(conversation: conv, quiz: quiz, index:i)
        i += 1
      end
    end
  end
end
puts "correspondance created"
puts "Conversation created"
puts "QuizConv create"

conversations = Conversation.all
conversations.each do |conv|
  10.times do
    Message.create!(user: conv.participants.sample, conversation: conv, content: Faker::Lorem.sentence )
  end
end
puts "Message created"

User.all.each do |u|
  users_except = users.reject{|us| us == u}
  rand(5).times do
    receiver = users_except.sample
    Comment.create!(content: Faker::Lorem.sentence, author: u, receiver: receiver)
    users_except = users_except.reject{|us| us == receiver}
  end
end
puts "comment created"


User.all.each do |u|
  sleep = ["Bed", "Couch"].sample
  place = rand(1..3)
  room = ["Living-room", "Bed-room"].sample
  img = get_random_image_flat
  flat = Flat.find_by(user: u)
  flat.update(description: Faker::Lorem.paragraph_by_chars, address: Faker::Address.street_address, sleep: sleep, place: place, room: room)
  flat.pictures.attach(io: File.open(img[0]), filename: img[1])
  img = get_random_image_flat
  flat.pictures.attach(io: File.open(img[0]), filename: img[1])
  img = get_random_image_flat
  flat.pictures.attach(io: File.open(img[0]), filename: img[1])
end
puts "Flat created"

puts "Seeding done"
