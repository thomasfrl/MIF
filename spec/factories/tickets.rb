FactoryBot.define do
  factory :ticket do
    object { "Object" }
    category { "Category" }
    content { "MyText" }
    user
    status { "Status" }
  end
end
