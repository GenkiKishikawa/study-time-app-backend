require 'faker'

FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    sequence(:email) { |num| "email_#{num}@test.com"
    }
    password { password }
    password_confirmation { password }
  end
end