FactoryBot.define do
  factory :ticket do
    object { "MyString" }
    category { "MyString" }
    content { "MyText" }
    user { nil }
    status { "MyString" }
  end
end
