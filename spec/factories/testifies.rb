FactoryBot.define do
  factory :testify do
    user
    content { "MyText" }
    accepted { false }
  end
end
