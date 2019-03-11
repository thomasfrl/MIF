FactoryBot.define do
  factory :flat do
    user { nil }
    adress { "MyString" }
    description { "MyText" }
    has_wifi { false }
  end
end
