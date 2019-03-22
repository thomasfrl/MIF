
FactoryBot.define do
  factory :comment do
    author
    receiver
    content { "MyTextMyTextMyText" }
  end
end
