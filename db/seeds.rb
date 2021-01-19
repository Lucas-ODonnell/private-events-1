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

User.create!(name: 'Example User',
             email: 'user@example.com',
             password: 'password',
             password_confirmation: 'password')

Event.create!(creator_id: '1',
              title: 'Ice Skating Party',
              description: 'We will ice skate first and then warm up over hot drinks at Starbucks',
              location: 'Millennium Park',
              start_date: Date.new(2022, 2, 1),
              start_time: Time.zone.local(1999, 12, 31, 18),
              end_date: Date.new(2022, 2, 1),
              end_time: Time.zone.local(1999, 12, 31, 22))

Event.create!(creator_id: '2',
              title: 'Picnic Party',
              description: 'We will explore the zoo and enjoy a sack luck together',
              location: 'Brookfield Zoo',
              start_date: Date.new(2022, 4, 15),
              start_time: Time.zone.local(1999, 12, 31, 10, 30),
              end_date: Date.new(2022, 4, 15),
              end_time: Time.zone.local(1999, 12, 31, 16))

Event.create!(creator_id: '7',
              title: 'Memorial Day Cookout',
              description: 'We will grill hamburgers & hot dogs. Please bring a side dish to share.',
              location: 'Grant Park',
              start_date: Date.new(2022, 5, 29),
              start_time: Time.zone.local(1999, 12, 31, 11),
              end_date: Date.new(2022, 5, 29),
              end_time: Time.zone.local(1999, 12, 31, 14, 30))

past_events = [ {
                creator_id: '1',
                title: "New Year's Party",
                description: 'Kick off the new year with friends and family!',
                location: 'My house',
                start_date: Date.new(2020, 12, 31),
                start_time: Time.zone.local(1999, 12, 31, 20),
                end_date: Date.new(2021, 1, 1),
                end_time: Time.zone.local(1999, 12, 31, 1, 30)
              },
              { creator_id: '7',
                title: 'Birthday Party',
                description: 'We will start the party in the Funhouse Maze and end with Gelato!',
                location: 'Navy Pier',
                start_date: Date.new(2020, 3, 9),
                start_time: Time.zone.local(1999, 12, 31, 13),
                end_date: Date.new(2020, 3, 9),
                end_time: Time.zone.local(1999, 12, 31, 17)
              }
             ]

past_events.each do |event|
  new_event = Event.new(event)
  new_event.save!(validate: false)
end

Invitation.create!(event_id: '1',
                   attendee_id: '2')

Invitation.create!(event_id: '1',
                   attendee_id: '3')

Invitation.create!(event_id: '1',
                   attendee_id: '4')

Invitation.create!(event_id: '1',
                   attendee_id: '5')

Invitation.create!(event_id: '1',
                   attendee_id: '6')

Invitation.create!(event_id: '1',
                   attendee_id: '7')

Invitation.create!(event_id: '2',
                   attendee_id: '1')

Invitation.create!(event_id: '2',
                   attendee_id: '3')

Invitation.create!(event_id: '2',
                   attendee_id: '4')

Invitation.create!(event_id: '2',
                   attendee_id: '5')

Invitation.create!(event_id: '2',
                   attendee_id: '6')

Invitation.create!(event_id: '2',
                   attendee_id: '7')

Invitation.create!(event_id: '3',
                   attendee_id: '1')

Invitation.create!(event_id: '3',
                  attendee_id: '2')

Invitation.create!(event_id: '3',
                   attendee_id: '3')

Invitation.create!(event_id: '3',
                   attendee_id: '4')

Invitation.create!(event_id: '3',
                   attendee_id: '5')

Invitation.create!(event_id: '3',
                   attendee_id: '6')

Invitation.create!(event_id: '4',
                   attendee_id: '2')

Invitation.create!(event_id: '4',
                   attendee_id: '3')

Invitation.create!(event_id: '4',
                   attendee_id: '4')

Invitation.create!(event_id: '4',
                   attendee_id: '5')

Invitation.create!(event_id: '4',
                   attendee_id: '6')

Invitation.create!(event_id: '4',
                   attendee_id: '7')

Invitation.create!(event_id: '5',
                   attendee_id: '1')

Invitation.create!(event_id: '5',
                    attendee_id: '2')

Invitation.create!(event_id: '5',
                   attendee_id: '3')

Invitation.create!(event_id: '5',
                   attendee_id: '4')

Invitation.create!(event_id: '5',
                   attendee_id: '5')

Invitation.create!(event_id: '5',
                   attendee_id: '6')


