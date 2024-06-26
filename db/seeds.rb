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
  username: 'john',
  city: 'Cannes',
  gender: 'Homme',
  user_id: user1.id
)

profile2 = Profile.create!(
  username: 'jane',
  city: 'Marseille',
  gender: 'Femme',
  user_id: user2.id
)

puts "Creating dogs ..."

dog1 = Dog.create!(
  name: 'Bobbie',
  breed: 'Chihuahua',
  age: 6,
  profile_id: profile1.id
)

dog2 = Dog.create!(
  name: 'Samy',
  breed: 'Bouldogue Français',
  age: 3,
  profile_id: profile1.id
)

dog3 = Dog.create!(
  name: 'Lola',
  breed: 'Labrador',
  age: 7,
  profile_id: profile2.id
)

dog4 = Dog.create!(
  name: 'Carine',
  breed: 'Teckel',
  age: 10,
  profile_id: profile2.id
)

puts "Creating groups..."

group1 = Group.create!(
  name: 'Balades à minuit',
  city: 'Monaco',
  description: 'On se balade.'
)

group2 = Group.create!(
  name: 'Toutou Club',
  city: 'Nice',
  description: 'A group for toutou lovers.',
)

group3 = Group.create!(
  name: 'Corgis only',
  city: 'Valbonne',
  description: 'Seulement des corgis.',
)

group4 = Group.create!(
  name: 'Labrador Ultra Fan',
  city: 'Cannes',
  description: 'Un groupe où on aime vraiment les labradors.',
)

group5 = Group.create!(
  name: 'Chihuahua Super Star',
  city: 'Mougins',
  description: 'Si toi aussi tu aimes les chihuahuas, viens avec nous!',
)

puts "Creating ProfileGroups..."

ProfileGroup.create!(profile: profile1, group: group1)
ProfileGroup.create!(profile: profile1, group: group2)
ProfileGroup.create!(profile: profile1, group: group3)

puts "Creating Walks..."

walk2 = Walk.create!(
  date: Date.today,
  start_time: Time.current,
  adress: "25 avenue de la Gare",
  group_id: group2.id,
  profile_id: profile1.id,
)

walk3 = Walk.create!(
  date: Date.today,
  start_time: Time.current,
  adress: "20 avenue de france",
  group_id: group2.id,
  profile_id: profile1.id,
)

walk4 = Walk.create!(
  date: Date.today,
  start_time: Time.current,
  adress: "12 boulevard du marché",
  group_id: group2.id,
  profile_id: profile1.id,
)

walk5 = Walk.create!(
  date: Date.today,
  start_time: Time.current,
  adress: "3 rue de france",
  group_id: group2.id,
  profile_id: profile1.id,
)

puts "Finished"
