FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    description { "MyText" }
    age { 1 }
    welcome_message { "MyText" }
    nationality { "MyString" }
    city { nil }
  end
end
