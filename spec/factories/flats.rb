FactoryBot.define do
  factory :flat do
    user
    address { "MyString" }
    description { "MyText" }
    has_wifi { false }
  end
end
