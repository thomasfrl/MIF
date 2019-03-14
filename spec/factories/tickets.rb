FactoryBot.define do
  factory :ticket do
    object { "MyString" }
    category { "MyString" }
    content { "MyText" }
    user
    status { "MyString" }
  end
end
