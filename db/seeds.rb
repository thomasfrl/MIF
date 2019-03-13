# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


City.destroy_all
Language.destroy_all
User.destroy_all
Correspondance.destroy_all

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




100.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars, age: (rand(15)+20), email: "#{Faker::Name.unique.first_name}@yopmail.com", password: "123456", city_id: City.all.sample.id )
end

75.times do
  correspondance = Correspondance.create!(user_one: User.all.sample, user_two: User.all.sample)
end

puts "Seeding done"
