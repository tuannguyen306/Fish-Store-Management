# Clear existing records in the correct order
Transaction.delete_all  # Delete dependent records first
Customer.delete_all
Sale.delete_all
Product.delete_all
Fish.delete_all

# Map each fish name to its corresponding image
fish_images = {
  "Goldfish" => Rails.root.join('app/assets/images/goldfish.jpg'),
  "Betta" => Rails.root.join('app/assets/images/betta.jpg'),
  "Guppy" => Rails.root.join('app/assets/images/guppy.jpg'),
  "Oscar" => Rails.root.join('app/assets/images/oscar.jpg'),
  "Clownfish" => Rails.root.join('app/assets/images/clownfish.jpg')
}

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

  # Attach the specific image to the fish
  image_path = fish_images[data[:name]]

  unless fish.image.attached?
    content_type = case File.extname(image_path).downcase
                   when '.jpg', '.jpeg'
                     'image/jpeg'
                   when '.png'
                     'image/png'
                   else
                     'image/gif'  # Default to gif if necessary
                   end

    fish.image.attach(
      io: File.open(image_path),
      filename: "#{data[:name].downcase}.jpg",
      content_type: content_type
    )
  end
end

# Seed products data - Ensure this is done before sales
products = [
  { name: "Goldfish Food", price: 5.99, description: "Premium flakes for goldfish", category: "Fish Supplies" },
  { name: "Aquarium Heater", price: 30.50, description: "Keeps your tank at the ideal temperature", category: "Equipment" },
  { name: "Aquarium Filter", price: 45.00, description: "Efficient filtration system for aquariums", category: "Equipment" },
  { name: "Water Conditioner", price: 10.00, description: "Makes tap water safe for fish", category: "Fish Supplies" },
  { name: "Fish Tank LED Light", price: 25.99, description: "Energy-saving LED lighting for aquariums", category: "Equipment" }
]

# Create products
products.each do |product_data|
  Product.find_or_create_by(name: product_data[:name]) do |product|
    product.price = product_data[:price]
    product.description = product_data[:description]
    product.category = product_data[:category]
  end
end

# Seed customers data
customers = [
  { name: "Alice", email: "alice@example.com", phone: "123-456-7890" },
  { name: "Bob", email: "bob@example.com", phone: "987-654-3210" },
  { name: "Charlie", email: "charlie@example.com", phone: "456-789-0123" }
]

customers.each do |customer_data|
  Customer.find_or_create_by(email: customer_data[:email]) do |customer|
    customer.name = customer_data[:name]
    customer.phone = customer_data[:phone]
  end
end

# Seed sales data - Make sure the products have been created before sales
sales = [
  { product_id: Product.find_by(name: "Goldfish Food").id, quantity: 2, total_price: 11.98 },
  { product_id: Product.find_by(name: "Aquarium Heater").id, quantity: 1, total_price: 30.50 },
  { product_id: Product.find_by(name: "Aquarium Filter").id, quantity: 1, total_price: 45.00 },
  { product_id: Product.find_by(name: "Water Conditioner").id, quantity: 3, total_price: 30.00 },
  { product_id: Product.find_by(name: "Fish Tank LED Light").id, quantity: 4, total_price: 103.96 }
]

sales.each do |sale_data|
  Sale.create!(sale_data)
end

# Seed transactions data for customers
customer1 = Customer.find_by(email: "alice@example.com")
customer2 = Customer.find_by(email: "bob@example.com")
customer3 = Customer.find_by(email: "charlie@example.com")

customer1.transactions.find_or_create_by(amount: 25.0, description: "Purchased Betta and supplies")
customer1.transactions.find_or_create_by(amount: 50.0, description: "Bulk order of Guppies")
customer2.transactions.find_or_create_by(amount: 200.0, description: "Custom aquarium setup")
customer3.transactions.find_or_create_by(amount: 15.0, description: "Small fish tank decorations")
customer3.transactions.find_or_create_by(amount: 30.0, description: "Added a heater to the tank")

puts "Database seeded with #{Fish.count} fish, #{Customer.count} customers, #{Transaction.count} transactions, #{Product.count} products, and #{Sale.count} sales."
