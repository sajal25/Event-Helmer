# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
event_types = EventType.create([
	{name: "Appearance or Signing"}, 
	{name: "Camp, Trip, or Retreat"}, 
	{name: "Class, Training, or Workshop"}, 
	{name: "Concert or Performance"}, 
	{name: "Meeting or Networking Event"}, 
	{name: "Festival or Fair"},
	{name: "Seminar or Talk"}, 
	{name: "Tradeshow, Consumer Show, or Expo"},
	{name: "Party or Social Gathering"},
	{name: "Race or Endurance Event"},
	{name: "Rally"},
	{name: "Screening"}
])

event_topics = EventTopic.create([
	{name: "Auto, Boat & Air"},
	{name: "Business & Professional"}, 
	{name: "Charity & Causes"},
	{name: "Community & Culture"},
	{name: "Family & Education"},
	{name: "Fashion & Beauty"},
	{name: "Film, Media & Entertainment"},
	{name: "Food & Drink"},
	{name: "Health & Wellness"},
	{name: "Hobbies & Special Interest"},
	{name: "Home & Lifestyle"},
	{name: "Performing & Visual Arts"},
	{name: "Religion & Spirituality"},
	{name: "School Activities"},
	{name: "Science & Technology"},
	{name: "Seasonal & Holiday"},
	{name: "Travel & Outdoor"},
	{name: "Sports & Fitness"}
])