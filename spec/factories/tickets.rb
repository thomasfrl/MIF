FactoryBot.define do
  factory :ticket do
    object { "MyString" }
    category { "MyString" }
    content { "MyText" }
    status { "MyString" }
    user { nil }
  end
end
