FactoryBot.define do
  factory :flat do
    user
    address { "Address" }
    description { "MyText" }
    place { 1 }
    room {"Bed-room"}
    sleep { "Couch" }
  end
end
