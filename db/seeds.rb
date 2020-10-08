# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

actor_headshots = ['https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1543949806-2c9935e6aa78?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1535324492437-d8dea70a38a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1579983926774-399a9cb765c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1540569014015-19a7be504e3a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'].sample

audition_locations = ['Pearl Studios', 'Ripley Grier', 'Shetler Studios', 'Chelsea Studios', '42nd Street Studios'].sample

theatre_locations = ['The Flea Theatre', "Imperial Theatre", "New York City Center", "Shea's Performing Arts Center"].sample

roles = ['Principal', 'Supporting', 'Ensemble'].sample

Role.delete_all
Gig.delete_all
CastingDirector.delete_all
Actor.delete_all

5.times do 
	CastingDirector.create!(
		name: Faker::Name.name, 
		email: Faker::Internet.unique.email(name: Faker::Name.name, domain: 'example'), 
		password: 'test', 
		agency: Faker::Company.name, 
		address: Faker::Address.street_address,
		city: Faker::Address.community,
		state: Faker::Address.state_abbr,
		zip: Faker::Address.zip
  )
end

10.times do 
  Actor.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		gender: Faker::Gender.binary_type,
		image: actor_headshots,
		email: Faker::Internet.unique.email(name: Faker::Name.name, domain: 'example'),  
		password: 'test', 
		address: Faker::Address.street_address,
		city: Faker::Address.community,
		state: Faker::Address.state_abbr,
		zip: Faker::Address.zip
  )
end

10.times do
    Gig.create!(
			casting_director_id: CastingDirector.all.ids.sample, 
			title: Faker::Theatre::Musicals.unique.title,
			gig_type: "Musical",
			union: [true, false].sample,
			producer: Faker::Name.name,
			director: Faker::Name.name,
			choreographer: Faker::Name.name,
			music_director: Faker::Name.name,
			opening_date: Faker::Date.between(from: '2021-01-01', to: '2021-03-31'),
			closing_date: Faker::Date.between(from: '2021-04-01', to: '2021-06-30'),
			gig_location: theatre_locations,
			pay_rate: "#{rand(300...1000)}/week",
      audition_date: Faker::Date.between(from: 14.days.from_now, to: 60.days.from_now),
			audition_location: audition_locations
    )
end

10.times do
	Gig.create!(
		casting_director_id: CastingDirector.all.ids.sample, 
		title: Faker::Theatre::Plays.unique.title,
		gig_type: "Play",
		union: [true, false].sample,
		producer: Faker::Name.name,
		director: Faker::Name.name,
		opening_date: Faker::Date.between(from: '2021-01-01', to: '2021-03-31'),
		closing_date: Faker::Date.between(from: '2021-04-01', to: '2021-06-30'),
		gig_location: theatre_locations,
		pay_rate: "$#{rand(300...1000)}/week",
		audition_date: Faker::Date.between(from: 14.days.from_now, to: 60.days.from_now), 
		audition_location: audition_locations
	)
end

20.times do
	Role.create!(
		gig_id: Gig.all.ids.sample,
		role_type: roles,
		name: Faker::Name.name,
		description: Faker::Lorem.paragraph,
		gender: Faker::Gender.type,
		beg_age_range: Faker::Number.between(from: 18, to: 30),
		end_age_range: Faker::Number.between(from: 31, to: 80),
	)
end