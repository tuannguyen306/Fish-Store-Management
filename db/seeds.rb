# Clear existing records
Fish.delete_all
Customer.delete_all
Transaction.delete_all

# Path to the placeholder image
image_path = Rails.root.join('app', 'assets', 'images', 'placeholder.jpg')

# Seed fish data
fish_data = [
  {
    name: "Goldfish",
    price: 10.0,
    species: "Carassius auratus",
    size: 15,
    water_type: "freshwater",
    quantity: 50,
    description: "A beautiful freshwater fish often kept in home aquariums."
  },
  {
    name: "Betta",
    price: 5.0,
    species: "Betta splendens",
    size: 7,
    water_type: "freshwater",
    quantity: 100,
    description: "Known as the Siamese fighting fish, admired for its vibrant colors."
  },
  {
    name: "Guppy",
    price: 3.0,
    species: "Poecilia reticulata",
    size: 5,
    water_type: "freshwater",
    quantity: 200,
    description: "A hardy and colorful species, ideal for beginners."
  },
  {
    name: "Oscar",
    price: 15.0,
    species: "Astronotus ocellatus",
    size: 25,
    water_type: "freshwater",
    quantity: 30,
    description: "A large and intelligent fish, popular among experienced aquarists."
  },
  {
    name: "Clownfish",
    price: 20.0,
    species: "Amphiprioninae",
    size: 10,
    water_type: "saltwater",
    quantity: 20,
    description: "A saltwater species made famous by the movie 'Finding Nemo.'"
  }
]

fish_data.each do |data|
  fish = Fish.find_or_create_by(name: data[:name]) do |f|
    f.price = data[:price]
    f.species = data[:species]
    f.size = data[:size]
    f.water_type = data[:water_type]
    f.quantity = data[:quantity]
    f.description = data[:description]
  end

  # Attach the placeholder image to the fish
  unless fish.image.attached?
    fish.image.attach(
      io: File.open(image_path),
      filename: 'placeholder.jpg',
      content_type: 'image/jpeg'
    )
  end
end

# Seed customer data
customer1 = Customer.find_or_create_by(name: "Alice", email: "alice@example.com", phone: "123-456-7890")
customer2 = Customer.find_or_create_by(name: "Bob", email: "bob@example.com", phone: "987-654-3210")
customer3 = Customer.find_or_create_by(name: "Charlie", email: "charlie@example.com", phone: "456-789-0123")

# Seed transaction data
customer1.transactions.find_or_create_by(amount: 25.0)
customer1.transactions.find_or_create_by(amount: 50.0)
customer2.transactions.find_or_create_by(amount: 200.0)
customer3.transactions.find_or_create_by(amount: 15.0)
customer3.transactions.find_or_create_by(amount: 30.0)

puts "Database seeded with #{Fish.count} fish and #{Customer.count} customers, with #{Transaction.count} transactions."
