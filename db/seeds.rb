require 'faker'

User.create!(
  :email => 'kishikawagenki0930@gmail.com',
  :password => 'battleship0930',
  :password_confirmation => 'battleship0930',
)

100.times do |n|
  Record.create!(
    study_time: Faker::Number.between(from: 1, to: 15000),
    start_year: 2024,
    start_month: 1,
    start_day: 1,
    start_time: Faker::Time.between(from: (Time.current - 60 * 60).strftime("%H:%M:%S"), to: Time.current.strftime("%H:%M:%S")),
    end_year: 2024,
    end_month: 1,
    end_day: 1,
    end_time: Time.current.strftime("%H:%M:%S"),
    memo: Faker::Lorem.sentence(word_count: 10),
    user_id: 1,
  )
end
