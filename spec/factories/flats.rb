FactoryBot.define do
  factory :flat do
    user { nil }
    address { "MyString" }
    description { "MyText" }
    has_wifi { false }
  end
end
