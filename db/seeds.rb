# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Random Name', email: 'alex@home.com', password: 'foobar', password_confirmation: 'foobar', activated: true, activated_at: Time.zone.now)

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n-1}@railstutorial.org"
  password = "foobar"
  User.create(name: name, email: email, password: password, password_confirmation: password, activated: true, activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do |n|
  body = Faker::Lorem.sentence(3)
  user.posts.create(body: Faker::Lorem.sentence(3))
  users.each { |user| user.posts.create!(body: body) }
end

user.posts.each do |p|
  Random.rand(30).times do |n|
    p.likes.create(user_id: n)
  end
end