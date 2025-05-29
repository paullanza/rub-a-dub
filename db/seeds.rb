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
  address: "4669 rue de Brébeuf, Montreal",
  size: Tub::SIZES.sample,
  category: Tub::CATEGORIES.sample,
  price: 35,
  user: user1
)
tub1.photos.attach(io: File.open("app/assets/images/bathtub1.jpg"), filename: "bathtub1.jpg")
tub1.photos.attach(io: File.open("app/assets/images/bathtub2.jpg"), filename: "bathtub2.jpg")
tub1.save

tub2 = Tub.create(
  name: "Power Jacuzzi!",
  description: "Fits 4 easily, place for an extra large pizza as well.",
  address: "5333 ave cagrain, Montreal",
  size: Tub::SIZES.sample,
  category: Tub::CATEGORIES.sample,
  price: 55,
  user: user1
)
tub2.photos.attach(io: File.open("app/assets/images/bathtub3.jpg"), filename: "bathtub3.jpg")
tub2.photos.attach(io: File.open("app/assets/images/bathtub4.jpg"), filename: "bathtub4.jpg")
tub2.save

tub3 = Tub.create(
  name: "Ultimate Massage",
  description: "A massive tub that will massage everyone inside!",
  address: "4690 rue St-Denis, Montreal",
  size: Tub::SIZES.sample,
  category: Tub::CATEGORIES.sample,
  price: 100,
  user: user2
)
tub3.photos.attach(io: File.open("app/assets/images/bathtub5.jpg"), filename: "bathtub5.jpg")
tub3.photos.attach(io: File.open("app/assets/images/bathtub6.jpg"), filename: "bathtub6.jpg")
tub3.save

tub4 = Tub.create(
  name: "Claw tub for 1",
  description: "Fits 4 easily, place for an extra large pizza as well.",
  address: "7422 rue St-Hubert, Montreal",
  size: Tub::SIZES.sample,
  category: Tub::CATEGORIES.sample,
  price: 20,
  user: user2
)
tub4.photos.attach(io: File.open("app/assets/images/bathtub7.jpg"), filename: "bathtub7.jpg")
tub4.photos.attach(io: File.open("app/assets/images/bathtub8.jpg"), filename: "bathtub8.jpg")
tub4.save

puts "All data succcesfully seeded! 🌱"
