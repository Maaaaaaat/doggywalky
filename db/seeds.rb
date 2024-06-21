# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Dog.destroy_all
Walk.destroy_all
ProfileGroup.destroy_all
Group.destroy_all
Profile.destroy_all
User.destroy_all


puts "Creating users..."

user1 = User.create!(
  email: 'john.doe@example.com',
  password: 'password123',
  first_name: 'John',
  last_name: 'Doe'
)

user2 = User.create!(
  email: 'jane.doe@example.com',
  password: 'password456',
  first_name: 'Jane',
  last_name: 'Doe'
)

puts "Creating profiles..."

profile1 = Profile.create!(
  username: 'johndoe',
  city: 'New York',
  gender: 'Male',
  user_id: user1.id
)

puts "Creating groups..."

group1 = Group.create!(
  name: 'Hiking Enthusiasts',
  city: 'New York',
  description: 'A group for people who love hiking.'
)

group2 = Group.create!(
  name: 'Book Club',
  city: 'New York',
  description: 'A group for book lovers to discuss literature.',
)

group3 = Group.create!(
  name: 'Tech Meetup',
  city: 'New York',
  description:'A group for tech enthusiasts to share knowledge and network.',
)

puts "Creating Walks ..."

walk2 = Walk.create!(
  date: Date.today,
  start_time: Time.now,
  adress: "Bordeaux",
  group_id: group2.id,
  profile_id: profile1.id ,
)

walk3 = Walk.create!(
  date: Date.today,
  start_time: Time.now,
  adress: "Marseille",
  group_id: group2.id,
  profile_id: profile1.id ,
)

walk4 = Walk.create!(
  date: Date.today,
  start_time: Time.now,
  adress: "Lyon",
  group_id: group2.id,
  profile_id: profile1.id ,
)

walk5 = Walk.create!(
  date: Date.today,
  start_time: Time.now,
  adress: "Lyon",
  group_id: group2.id,
  profile_id: profile1.id ,
)

puts "Finished"

# pro_group = ProfileGroup.new
# pro_group.profile = profile1
# pro_group.group = group1
# pro_group.save
