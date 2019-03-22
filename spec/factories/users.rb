require 'faker'

FactoryBot.define do
  factory :user, aliases: [:author, :receiver, :creator, :acceptor] do
    first_name { "First Name" }
    last_name { "Last Name" }
    description { "MyText" }
    age { 20 }
    welcome_message { "MyText" }
    nationality { "Nationality" }
    city {FactoryBot.create(:city)}
    email { Faker::Internet.email }
    password { "test123456" }
  end
end

