FactoryBot.define do
  factory :trip do
    correspondance { FactoryBot.create(:correspondance) }
    host { FactoryBot.create(:user) }
    duration { 1 }
    start_date { "2019-03-14 14:49:49" }
  end
end
