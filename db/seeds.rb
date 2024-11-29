# Clear existing records
Fish.delete_all

# Seed new data with find_or_create_by to avoid duplicates
Fish.find_or_create_by(name: "Goldfish") do |fish|
  fish.price = 10.0
  fish.species = "Carassius auratus"
  fish.size = 15
  fish.water_type = "freshwater"
  fish.quantity = 50
  fish.images = "goldfish.jpg"
  fish.description = "A beautiful freshwater fish often kept in home aquariums."
end

Fish.find_or_create_by(name: "Betta") do |fish|
  fish.price = 5.0
  fish.species = "Betta splendens"
  fish.size = 7
  fish.water_type = "freshwater"
  fish.quantity = 100
  fish.images = "betta.jpg"
  fish.description = "Known as the Siamese fighting fish, admired for its vibrant colors."
end

Fish.find_or_create_by(name: "Guppy") do |fish|
  fish.price = 3.0
  fish.species = "Poecilia reticulata"
  fish.size = 5
  fish.water_type = "freshwater"
  fish.quantity = 200
  fish.images = "guppy.jpg"
  fish.description = "A hardy and colorful species, ideal for beginners."
end

Fish.find_or_create_by(name: "Oscar") do |fish|
  fish.price = 15.0
  fish.species = "Astronotus ocellatus"
  fish.size = 25
  fish.water_type = "freshwater"
  fish.quantity = 30
  fish.images = "oscar.jpg"
  fish.description = "A large and intelligent fish, popular among experienced aquarists."
end

Fish.find_or_create_by(name: "Clownfish") do |fish|
  fish.price = 20.0
  fish.species = "Amphiprioninae"
  fish.size = 10
  fish.water_type = "saltwater"
  fish.quantity = 20
  fish.images = "clownfish.jpg"
  fish.description = "A saltwater species made famous by the movie 'Finding Nemo.'"
end

puts "Database seeded with #{Fish.count} fish."
