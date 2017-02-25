# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Alex Garrett', email: 'alex@home.com', password: 'foobar', password_confirmation: 'foobar')

user = User.find_by_email('alex@home.com')
50.times do
  body = Faker::Lorem.sentence(5)
  user.posts.build(body: body)
end