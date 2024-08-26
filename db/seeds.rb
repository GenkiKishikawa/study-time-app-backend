require 'faker'

User.create!(
  :email => 'kishikawagenki0930@gmail.com',
  :password => 'battleship0930',
  :password_confirmation => 'battleship0930',
)

Category.create!(
  name: 'React',
  color: "#00ffff",
  user_id: 1,
)
Category.create!(
  name: '英語',
  color: "#ff7f50",
  user_id: 1,
)



1000.times do |n|
  start_datetime = Faker::Time.between(from: DateTime.now - 2.year, to: DateTime.now)
  end_datetime = start_datetime + rand(1..6).hours + rand(1..60).minutes
  Record.create!(
    study_minutes: (end_datetime - start_datetime) / 60,
    start_datetime: start_datetime,
    end_datetime: end_datetime,
    memo: Faker::Lorem.sentence(word_count: 10),
    user_id: 1,
    category_id: Faker::Number.between(from: 1, to: 2),
  )
end
