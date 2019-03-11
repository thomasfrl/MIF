FactoryBot.define do
  factory :comment do
    author { nil }
    user { nil }
    content { "MyText" }
  end
end
