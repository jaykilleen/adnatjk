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
jay = User.create!(name: 'Jay Killeen',    email: 'me@jaykilleen.com', password: 'password', password_confirmation: 'password')
nan = User.create!(name: 'Nancy Richards', email: 'nancy@gmail.com',   password: 'password', password_confirmation: 'password')
roy = User.create!(name: 'Roy Hunter',     email: 'roy@gmail.com',     password: 'password', password_confirmation: 'password')
sal = User.create!(name: 'Sal Rogers',     email: 'sal@hotmail.com',   password: 'password', password_confirmation: 'password')
puts "There are #{User.count} records in the users table."

puts 'Seeding Organisations'
org1 = Organisation.create!(name: 'Strawberry Farm', hourly_rate: 0.10)
org2 = Organisation.create!(name: 'Pineapple Farm',  hourly_rate: 20.00)
org3 = Organisation.create!(name: 'Cafe Tequila',    hourly_rate: 15.00)
puts "There are #{Organisation.count} records in the organisations table."
puts "There are #{User.count} records in the users table."

puts 'Seeding Organisations'
Shift.create!(organisation_id: org1.id, user_id: jay.id, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: org1.id, user_id: jay.id, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: org1.id, user_id: nan.id, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: org1.id, user_id: roy.id, break_length: "15", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: org2.id, user_id: jay.id, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: org2.id, user_id: sal.id, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: org2.id, user_id: sal.id, break_length: "30", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: org2.id, user_id: sal.id, break_length: "60", start: Time.parse("2020-01-22 07:30"), finish: Time.parse("2020-01-22 17:00"))
Shift.create!(organisation_id: org1.id, user_id: jay.id, break_length: "30", start: Time.parse("2020-01-22 21:00"), finish: Time.parse("2020-01-23 05:00"))
Shift.create!(organisation_id: org1.id, user_id: jay.id, break_length: "30", start: Time.parse("2020-02-15 21:00"), finish: Time.parse("2020-02-16 05:00"))
Shift.create!(organisation_id: org1.id, user_id: jay.id, break_length: "30", start: Time.parse("2020-02-16 09:00"), finish: Time.parse("2020-02-16 17:00"))

puts "There are #{Shift.count} records in the organisations table."

puts "Databases #{Rails.env} tables are now successfully seeded!"
