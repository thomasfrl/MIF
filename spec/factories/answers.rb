FactoryBot.define do
  factory :answer do
    conversation { nil }
    quiz { nil }
    content { "MyText" }
    author { nil }
  end
end
