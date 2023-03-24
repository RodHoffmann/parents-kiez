# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create(
#   email: "example@example.com",
#   password: "password"
# )

# Item.create(
#   name: "Example Item",
#   description: "This is an example item.",
#   age: "5-10 years",
#   house: "Ravenclaw",
#   available: true,
#   user_id: User.last.id
# )

# Create users
user1 = User.create!(
  email: "user1@example.com",
  password: "password",
  first_name: "John",
  last_name: "Doe",
  address: "123 Main St"
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password",
  first_name: "Jane",
  last_name: "Doe",
  address: "456 Elm St"
)

# Create items
item1 = user1.items.create!(
  name: "Baby rattle",
  description: "A colorful plastic rattle for babies",
  age: "0-6 months",
  house: "clean",
  available: true,
  user_id: User.last.id
)
p item1

item2 = user2.items.create!(
  name: "Toddler shoes",
  description: "A pair of used toddler shoes in good condition",
  age: "1-2 years",
  house: "pet-free",
  available: true,
  user_id: User.last.id
)
p item2

item3 = user1.items.create!(
  name: "Baby clothes",
  description: "A bag of gently used baby clothes",
  age: "0-6 months",
  house: "smoke-free",
  available: true,
  user_id: User.last.id
)
p item3

item4 = user2.items.create!(
  name: "Potty seat",
  description: "A used potty seat in good condition",
  age: "1-3 years",
  house: "clean",
  available: true,
  user_id: User.last.id
)
p item4
