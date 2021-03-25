# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

category_name = ['action', 'comedy', 'drama', 'fantasy', 'horror', 'mystery', 'romance', 'thriller']

User.destroy_all
Movie.destroy_all
Category.destroy_all

puts 'Start seeding Categories'

category_name.each do |name|
  description = Faker::Lorem.sentence
  category = {
    name: name,
    description: description
  }
  Category.create(category)
end

puts 'Finish seeding Categories'

puts 'Start seeding Users'
rand(1..4).times do
  user = {
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  }
  User.create(user)
end
puts 'Finish seeding Users'

puts 'Start seeding Movies'
categories = Category.all


categories.each do |category|
  movie = {
    name: Faker::Movie.title,
    director: Faker::Movies::Departed.actor,
    category_id: category.id,
    release_date: Faker::Date.in_date_period
  }
  Movie.create(movie)
end

puts 'Finish seeding Movies'
