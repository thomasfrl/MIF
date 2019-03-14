
FactoryBot.define do
  factory :comment do
    author
    receiver
    content { "MyText" }
  end
end
