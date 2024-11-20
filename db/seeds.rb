# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Fish.delete_all

fish = Fish.create([
  { name: "Goldfish", price: 10.0, species: "Carassius auratus", size: 15, water_type: "freshwater", quantity: 50 },
  { name: "Betta", price: 5.0, species: "Betta splendens", size: 7, water_type: "freshwater", quantity: 100 },
  { name: "Guppy", price: 3.0, species: "Poecilia reticulata", size: 5, water_type: "freshwater", quantity: 200 },
  { name: "Oscar", price: 15.0, species: "Astronotus ocellatus", size: 25, water_type: "freshwater", quantity: 30 },
  { name: "Clownfish", price: 20.0, species: "Amphiprioninae", size: 10, water_type: "saltwater", quantity: 20 }
])
