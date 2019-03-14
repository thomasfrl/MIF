FactoryBot.define do
  factory :message do
    user
    conversation
    content { 'test' }
    read { false }
  end
end
