puts "Clearing out the database! 🧹"

User.destroy_all
Tub.destroy_all
Soak.destroy_all

puts "Database cleared!"

bathtub_names = [
  "Bubble Bliss",
  "Soak Station",
  "Aqua Haven",
  "Tubtopia",
  "Relaxation Reef",
  "The Soothing Soaker",
  "Serenity Sink",
  "The Bubble Nest",
  "Tranquil Tub",
  "The Cozy Cove",
  "Splash Sanctuary",
  "Zen Bath Retreat",
  "The Soak Spot",
  "Bath Bliss",
  "The Drift Tub",
  "The Hydro Haven",
  "Lavender Lagoon",
  "The Calm Cove",
  "The Foam Fortress",
  "Ebb & Flow Tub"
]

bathtub_descriptions = [
  "Experience ultimate relaxation with a soothing bubble bath.",
  "Your perfect spot to unwind after a long day.",
  "Dive into tranquility in this serene aqua retreat.",
  "A whimsical tub designed for joyful soaking sessions.",
  "Escape to your personal relaxation reef with calming waters.",
  "The ideal soak for calming both body and mind.",
  "Find peace and comfort in this serene soaking sanctuary.",
  "A cozy nook filled with gentle bubbles for pure bliss.",
  "Unplug and rejuvenate in this peaceful, tranquil tub.",
  "Snuggle into comfort and warmth in this inviting cove.",
  "Refresh and recharge in a splash-filled sanctuary.",
  "A zen-inspired bath to center your mind and soul.",
  "Your go-to spot for a long, luxurious soak.",
  "Indulge in pure bliss with every bubble and drop.",
  "Let your worries drift away in this calming tub.",
  "Enjoy a hydrating soak in this modern aqua haven.",
  "Surround yourself with soothing scents and gentle waters.",
  "A calming retreat to soothe tired muscles and stress.",
  "Feel fortified and refreshed in this foam-filled fortress.",
  "Experience the perfect ebb and flow of relaxation."
]

montreal_addresses = [
  "1234 Rue Sainte-Catherine Ouest, Montréal, QC H3G 1P2",
  "5678 Boulevard Saint-Laurent, Montréal, QC H2T 2N4",
  "9101 Avenue du Mont-Royal Est, Montréal, QC H2J 1X7",
  "2345 Rue Sherbrooke Est, Montréal, QC H2K 1E7",
  "7890 Rue Saint-Denis, Montréal, QC H2J 2L4",
  "3456 Rue Notre-Dame Ouest, Montréal, QC H4C 1P4",
  "6789 Avenue Papineau, Montréal, QC H2K 4J6",
  "1122 Boulevard René-Lévesque Ouest, Montréal, QC H3B 2L5",
  "3344 Rue Saint-Urbain, Montréal, QC H2X 2N8",
  "5566 Avenue des Pins Ouest, Montréal, QC H3A 1T8",
  "7788 Rue Jean-Talon Est, Montréal, QC H1S 1J9",
  "9900 Boulevard de Maisonneuve Ouest, Montréal, QC H3J 2V9",
  "4321 Rue Rachel Est, Montréal, QC H2J 2J4",
  "8765 Avenue du Parc, Montréal, QC H2W 1S4",
  "3451 Rue Saint-Hubert, Montréal, QC H2L 3E3",
  "2233 Rue Bélanger, Montréal, QC H2S 1G4",
  "6677 Avenue Christophe-Colomb, Montréal, QC H2S 3J2",
  "8899 Rue Saint-Dominique, Montréal, QC H2S 2E6",
  "1010 Boulevard Saint-Joseph Est, Montréal, QC H2J 1L6",
  "5555 Rue Villeray, Montréal, QC H2R 1Z9"
]

puts "Creating users! 🏃‍♂️🏃‍♂️🏃‍♀️🏃‍♀️🏃‍♂️🏃‍♂️🏃‍♀️🏃‍♀️"
User.create(
  email: "a@a.a",
  password: "aaa111",
  first_name: "Mac",
  last_name: "Donald"
)
User.create(
  email: "b@b.b",
  password: "aaa111",
  first_name: "Sally",
  last_name: "Smith"
)
User.create(
  email: "c@c.c",
  password: "aaa111",
  first_name: "Johnson",
  last_name: "Thomson"
)
User.create(
  email: "d@d.d",
  password: "aaa111",
  first_name: "Thomas",
  last_name: "Johnsonson"
)
User.create(
  email: "e@e.e",
  password: "aaa111",
  first_name: "Megan",
  last_name: "McDonald"
)
User.create(
  email: "f@f.f",
  password: "aaa111",
  first_name: "Jessica",
  last_name: "Jones"
)

users = User.all

puts "Creating tubs! 🛁"
i = 1
bathtub_names.each do |name|
  tub = Tub.create(
    name: name,
    description: bathtub_descriptions.sample,
    address: montreal_addresses.sample,
    size: Tub::SIZES.sample,
    category: Tub::CATEGORIES.sample,
    price: rand(4.99..199.99),
    user: users.sample
  )
  tub.photos.attach(io: File.open("app/assets/images/bathtub#{i}.jpg"), filename: "bathtub#{i}.jpg")
  i += 1
  tub.photos.attach(io: File.open("app/assets/images/bathtub#{i}.jpg"), filename: "bathtub#{i}.jpg")
  tub.save
  i += 1
end

puts "All data succcesfully seeded! 🌱"
