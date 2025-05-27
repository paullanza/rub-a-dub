puts "Clearing out the database! 🧹"

User.destroy_all
Tub.destroy_all
Soak.destroy_all

puts "Database cleared!"

puts "Creating users! 🏃‍♂️🏃‍♂️🏃‍♀️🏃‍♀️"
user1 = User.create(
  email: "a@a.a",
  password: "aaa111",
  first_name: "Mac",
  last_name: "Donald"
)
user2 = User.create(
  email: "b@b.b",
  password: "aaa111",
  first_name: "Sally",
  last_name: "Smith"
)

puts "Creating tubs! 🛁"
tub1 = Tub.create(
  name: "Hot Johnson Tub!",
  description: "This is a super great tub, fits at least 2!",
  size: "extra medium",
  category: "standard",
  price: 35,
  user: user1
)
tub2 = Tub.create(
  name: "Power Jacuzzi!",
  description: "Fits 4 easily, place for an extra large pizza as well.",
  size: "large",
  category: "jacuzzi",
  price: 55,
  user: user1
)
tub3 = Tub.create(
  name: "Ultimate Massage",
  description: "A massive tub that will massage everyone inside!",
  size: "extra large",
  category: "jet",
  price: 100,
  user: user2
)
tub4 = Tub.create(
  name: "Claw tub for 1",
  description: "Fits 4 easily, place for an extra large pizza as well.",
  size: "small",
  category: "claw",
  price: 20,
  user: user2
)

puts "All data succcesfully seeded! 🌱"
