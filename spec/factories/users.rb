require 'faker'

FactoryBot.define do
  factory :user, aliases: [:author, :receiver, :user_one, :user_two] do
    first_name { "MyString" }
    last_name { "MyString" }
    description { "MyText" }
    age { 20 }
    welcome_message { "MyText" }
    nationality { "MyString" }
    city { nil }
    email { Faker::Internet.email }
    password { "test123456" }
  end
end

