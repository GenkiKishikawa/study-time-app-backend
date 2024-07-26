require 'faker'

User.create!(
  :email => 'kishikawagenki0930@gmail.com',
  :password => 'battleship0930',
  :password_confirmation => 'battleship0930',
)

Category.create!(
  name: 'React',
  user_id: 1,
)


100.times do |n|
  month = Faker::Number.between(from: 1, to: 7)
  day = Faker::Number.between(from: 1, to: 28)
  Record.create!(
    study_time: Faker::Number.between(from: 1, to: 15000),
    start_year: 2024,
    start_month: month,
    start_day: day,
    start_time: Faker::Time.between(from: (Time.current - 60 * 60).strftime("%H:%M:%S"), to: Time.current.strftime("%H:%M:%S")),
    end_year: 2024,
    end_month: month,
    end_day: day,
    end_time: Time.current.strftime("%H:%M:%S"),
    memo: Faker::Lorem.sentence(word_count: 10),
    user_id: 1,
    category_id: 1,
  )
end
