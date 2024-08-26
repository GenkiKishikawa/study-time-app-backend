require 'faker'

FactoryBot.define do
  factory :record do
    association :user
    association :category

    start_datetime { Faker::Time.between(from: 2.years.ago, to: DateTime.now) }
    end_datetime   { start_datetime + rand(1..6).hours + rand(1..60).minutes }
    study_minutes  { (end_datetime - start_datetime).to_i / 60 }
    memo           { Faker::Lorem.sentence(word_count: 10) }
  end
end
