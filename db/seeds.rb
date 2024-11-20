# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Clear existing records
Fish.delete_all

# Seed new data with find_or_create_by to avoid duplicates
Fish.find_or_create_by(name: "Goldfish") do |fish|
  fish.price = 10.0
  fish.species = "Carassius auratus"
  fish.size = 15
  fish.water_type = "freshwater"
  fish.quantity = 50
end

Fish.find_or_create_by(name: "Betta") do |fish|
  fish.price = 5.0
  fish.species = "Betta splendens"
  fish.size = 7
  fish.water_type = "freshwater"
  fish.quantity = 100
end

Fish.find_or_create_by(name: "Guppy") do |fish|
  fish.price = 3.0
  fish.species = "Poecilia reticulata"
  fish.size = 5
  fish.water_type = "freshwater"
  fish.quantity = 200
end

Fish.find_or_create_by(name: "Oscar") do |fish|
  fish.price = 15.0
  fish.species = "Astronotus ocellatus"
  fish.size = 25
  fish.water_type = "freshwater"
  fish.quantity = 30
end

Fish.find_or_create_by(name: "Clownfish") do |fish|
  fish.price = 20.0
  fish.species = "Amphiprioninae"
  fish.size = 10
  fish.water_type = "saltwater"
  fish.quantity = 20
end

puts "Database seeded with #{Fish.count} fish."

