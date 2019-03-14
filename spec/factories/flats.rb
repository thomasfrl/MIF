FactoryBot.define do
  factory :flat do
    user
    address { "Address" }
    description { "MyText" }
    has_wifi { false }
  end
end
