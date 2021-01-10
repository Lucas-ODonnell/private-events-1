# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Sybil Branson',
             email: 'sybil@branson.com',
             password: 'sbPassword',
             password_confirmation: 'sbPassword')

User.create!(name: 'Mary Talbot',
             email: 'mary@talbot.com',
             password: 'mtPassword',
             password_confirmation: 'mtPassword')

User.create!(name: 'Edith Pelham',
             email: 'edith@pelham.com',
             password: 'epPassword',
             password_confirmation: 'epPassword')

User.create!(name: 'Cora Crawley',
             email: 'cora@crawley.com',
             password: 'ccPassword',
             password_confirmation: 'ccPassword')

User.create!(name: 'Anna Bates',
             email: 'anna@bates.com',
             password: 'abPassword',
             password_confirmation: 'abPassword')

User.create!(name: 'Elsie Carson',
             email: 'elsie@carson.com',
             password: 'ecPassword',
             password_confirmation: 'ecPassword')

Event.create!(creator_id: '1',
              title: "New Year's Day Party",
              description: 'Kick off the new year with friends!',
              location: 'Our house',
              start_time: DateTime.new(2022,01,01,14),
              end_time: DateTime.new(2022,01,01,18))

Event.create!(creator_id: '2',
              title: "Valentine's Day Celebration",
              description: 'Party for everyone, not just couples',
              location: "Granny's House",
              start_time: DateTime.new(2021,02,14,18),
              end_time: DateTime.new(2022,01,01,22))
