require 'faker'

FactoryBot.define do
  factory :city do
    name { "MyString" }
    country { "MyString" }
    zip_code { Faker::Address.zip_code }
  end
end
