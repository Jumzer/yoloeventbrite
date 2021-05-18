# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.delete_all
Event.delete_all
Attendance.delete_all

10.times do |x|
  mail = Faker::Lorem.word
  email = "#{mail}@yopmail.com"
  user = User.create(
    first_name: Faker::TvShows::NewGirl.character,
    last_name: Faker::TvShows::GameOfThrones.house,
    email: email)
    puts "Seeding of User nb #{x}"
end

t1 = Time.now
t2 = Time.parse("2023-01-01 00:00:00")

10.times do |x|
  event = Event.create(start_date: rand(t1..t2),
  duration: rand(5..100)*5,
  description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: false),
  location: Faker::Address.city,
  price: rand(1..1000),
  title: Faker::Book.title,
  admin: User.all.sample)
  puts "Seeding of Event nb #{x}"
end

20.times do |x|
  attendance = Attendance.create(
    user: User.all.sample,
    event: Event.all.sample)
    puts "Seeding of Attendance nb #{x}"
end