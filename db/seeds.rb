# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.execute("TRUNCATE users RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE organisations RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE shifts RESTART IDENTITY CASCADE")

puts 'Seeding Users'
user = User.create!(id: 1, name: 'Jay Killeen', email: 'me@jaykilleen.com', password: 'password', password_confirmation: 'password')
user = User.create!(id: 2, name: 'Nancy Richards', email: 'nancy@gmail.com', password: 'password', password_confirmation: 'password')
user = User.create!(id: 3, name: 'Roy Hunter', email: 'roy@gmail.com', password: 'password', password_confirmation: 'password')
user = User.create!(id: 4, name: 'Sal Rogers', email: 'sal@hotmail.com', password: 'password', password_confirmation: 'password')
puts "There are #{User.count} records in the users table."

puts 'Seeding Organisations'
Organisation.create!(id: 1, name: 'Strawberry Farm', hourly_rate: 9.99)
Organisation.create!(id: 2, name: 'Pineapple Farm', hourly_rate: 20.00)
Organisation.create!(id: 3, name: 'Cafe Tequila', hourly_rate: 15.00)
puts "There are #{Organisation.count} records in the organisations table."
puts "There are #{User.count} records in the users table."

puts 'Seeding Organisations'
Shift.create!(organisation_id: 1, user_id: 1, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: 1, user_id: 1, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: 1, user_id: 2, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: 1, user_id: 3, break_length: "15", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: 2, user_id: 1, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: 2, user_id: 4, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: 2, user_id: 4, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: 2, user_id: 4, break_length: "60", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
puts "There are #{Shift.count} records in the organisations table."

puts "Databases #{Rails.env} tables are now successfully seeded!"