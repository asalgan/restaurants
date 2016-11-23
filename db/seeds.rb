User.create(api_key: SecureRandom.base(24))
# Menu item categories: %w(entree appetizer dessert beverage side)

restaurant1 = Restaurant.create(name: "Thai Tanic", description: "Unsinkable Thai", rating: 3.4, address: "3829 Western Avenue", city: "Chicago", state: "IL", zip: 60657)
restaurant2 = Restaurant.create(name: "Pita Pan", description: "Pitas that never grow old", rating: 4.1, address: "2525 Kolmar Avenue", city: "Chicago", state: "IL", zip: 60617)
restaurant3 = Restaurant.create(name: "Brewed Awakening", description: "Don't talk to me until I've had my coffee", rating: 4.5, address: "9057 Cicero St.", city: "Chicago", state: "IL", zip: 61068)
restaurant4 = Restaurant.create(name: "Basic Kneads Pizza", description: "Food, shelter, clothing, pizza", rating: 2.9, address: "9882 Broadway Avenue", city: "Chicago", state: "IL", zip: 60627)
restaurant5 = Restaurant.create(name: "Thairanosaurus", description: "Portions large enough for a dinosaur", rating: 4.0, address: "2958 Racine Street", city: "Chicago", state: "IL", zip: 58205)

MenuItem.create(restaurant_id: restaurant1.id, name: "Pad Thai", description: "Delicious noodles and peanut sauce", category: 0)
MenuItem.create(restaurant_id: restaurant1.id, name: "Shrimp Spring Rolls", description: "Shrimp and vegetables rolled up.", category: 1)

MenuItem.create(restaurant_id: restaurant2.id, name: "Chicken Gyros", description: "Chicken sliced off a spit with tzatziki", category: 0)
MenuItem.create(restaurant_id: restaurant2.id, name: "Pepsi", description: "Sorry it's not Coke", category: 3)

MenuItem.create(restaurant_id: restaurant3.id, name: "Espresso", description: "A strong shot of coffee", category: 3)
MenuItem.create(restaurant_id: restaurant3.id, name: "Scone", description: "Basically a dry muffin", category: 4)

MenuItem.create(restaurant_id: restaurant4.id, name: "Sausage Pizza", description: "14 inch pizza with Italian sausage", category: 0)
MenuItem.create(restaurant_id: restaurant4.id, name: "Brownie", description: "Fresh baked chocolate brownie", category: 2)

MenuItem.create(restaurant_id: restaurant5.id, name: "Mango Sticky Rice", description: "Fresh mango with warm sticky rice", category: 2)
MenuItem.create(restaurant_id: restaurant5.id, name: "Green Tea", description: "Hot green tea", category: 3)
