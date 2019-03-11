FactoryBot.define do
  factory :trip do
    start_date { "2019-03-11 18:08:04" }
    duration { 1 }
    correspondance { nil }
    host { nil }
  end
end
