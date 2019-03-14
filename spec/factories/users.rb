FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    description { "MyText" }
    age { 20 }
    welcome_message { "MyText" }
    nationality { "MyString" }
    city { nil }
    email { "MyString@yopmail.com"}
    password { "test123456" }
  end
end
