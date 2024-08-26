FactoryBot.define do
  factory :category do
    association :user

    name { 'React' }
    color { "#00ffff" }
  end
end