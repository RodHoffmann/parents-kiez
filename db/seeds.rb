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
require "open-uri"

puts "Deleting Users..."

User.destroy_all

puts "Deleting Chatrooms..."

Chatroom.destroy_all

puts "Deleting Messages..."

Message.destroy_all
puts "Deleting babysitters"

Babysitter.destroy_all

puts "Creating Users..."

users = []

john = User.create(email: 'john@example.com',
  password: '123456',
  first_name: 'John',
  last_name: 'Doe',
  address: 'Berliner Alle 125')

john.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098718/d4f1w05kkbpee3sctons.jpg'), filename: 'profile1.jpg', content_type: 'image/jpg')
p john
users << john

felix = User.create(email: 'felix@example.com',
  password: '123456',
  first_name: 'Felix',
  last_name: 'Baumgartner',
  address: 'Rosa Luxemburg Str. 84')

felix.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098713/ikvov8istpbwhcf0k9tg.jpg'), filename: 'profile2.jpg', content_type: 'image/jpg')
p felix
users << felix

jane = User.create(email: 'jane@example.com',
  password: '123456',
  first_name: 'Jane',
  last_name: 'Jackson',
  address: 'Simon Bolivar Str. 52')

jane.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098708/aqfxtwzil5kqpqb2k740.jpg'), filename: 'profile3.jpg', content_type: 'image/jpg')
p jane
users << jane

norma = User.create(email: 'norma@example.com',
  password: '123456',
  first_name: 'Norma',
  last_name: 'Baker',
  address: 'Sonnenalle 785')

norma.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098703/opaimkxebgsw1ld2gosw.jpg'), filename: 'profile4.jpg', content_type: 'image/jpg')
p norma
users << norma

rodrigo = User.create(email: 'rodrigo@example.com',
  password: '123456',
  first_name: 'Rodrigo',
  last_name: 'Mueller',
  address: 'Schönhauser Alle 77')

rodrigo.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098439/ucuf0ijqdn74bbxgzcg9.jpg'), filename: 'profile5.jpg', content_type: 'image/jpg')
p rodrigo
users << rodrigo

puts "Users creation completed successfuly"

puts "Creating Items.."

image_item1 = URI.open("https://www.verywellfamily.com/thmb/oAmzoovzj0HqQmprnm9KkwueGJ4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Best-Baby-Rattles-VWF-tout-281a53fe25764897ad227834f014e655.jpg")
item1 = john.items.create!(
  name: "Baby rattle",
  description: "A colorful plastic rattle for babies",
  age: "0-6 months",
  house: "Herman Str.5",
  available: true,
  user_id: User.last.id
)
p item1
item1.image.attach(io: image_item1, filename: "item1.jpg")
item1.image.analyze
item1.image.metadata["public_id"] = Cloudinary::Uploader.upload(item1.image.blob.url, resource_type: :auto)["public_id"]
item1.save

image_item2 = URI.open("https://cdn.shopify.com/s/files/1/1428/3302/products/Kids_Shoes_SS22_Ravine_Denim_P_1024x1024.jpg?v=1642550883")
item2 = felix.items.create!(
  name: "Toddler shoes",
  description: "A pair of used toddler shoes in good condition",
  age: "1-2 years",
  house: "Eisenacher Str.7",
  available: true,
  user_id: User.last.id
)
p item2
item2.image.attach(io: image_item2, filename: "item2.jpg")
item2.image.analyze
item2.image.metadata["public_id"] = Cloudinary::Uploader.upload(item2.image.blob.url, resource_type: :auto)["public_id"]
item2.save

image_item3 = URI.open("https://www.sassymamasg.com/wp-content/uploads/2021/11/kids-clothes-babies-singapore-poney.jpeg")
item3 = jane.items.create!(
  name: "Baby clothes",
  description: "A bag of gently used baby clothes",
  age: "0-6 months",
  house: "Wittineu Str.17",
  available: true,
  user_id: User.last.id
)
p item3
item3.image.attach(io: image_item3, filename: "item3.jpg")
item3.image.analyze
item3.image.metadata["public_id"] = Cloudinary::Uploader.upload(item3.image.blob.url, resource_type: :auto)["public_id"]
item3.save

image_item4 = URI.open("https://media-www.canadiantire.ca/product/fixing/plumbing/faucets-fixtures/0631048/children-s-potty-seat-75f8a6df-590e-4147-9da1-758f491bb969.png")
item4 = norma.items.create!(
  name: "Potty seat",
  description: "A used potty seat in good condition",
  age: "1-3 years",
  house: "Senftenberger 17",
  available: true,
  user_id: User.last.id
)
p item4
item4.image.attach(io: image_item4, filename: "item4.jpg")
item4.image.analyze
item4.image.metadata["public_id"] = Cloudinary::Uploader.upload(item4.image.blob.url, resource_type: :auto)["public_id"]
item4.save

puts "Items created successfully"

puts "Creating Chatrooms..."

chatrooms = []

users.combination(2).to_a.each_with_index do |chatters, index|
  chatrooms << instance_variable_set("@chatroom#{index}", Chatroom.create(user1: chatters[0], user2: chatters[1]))
  p chatrooms[index]
end


puts "Chatrooms creation completed successfuly"

puts "Creating messages..."

chatrooms.each do |chatroom|
  Message.create(content: 'Hello, how are you?', user_id: chatroom.user1.id, chatroom_id: chatroom.id)
  Message.create(content: 'Fine, thank you for asking! how about you?', user_id: chatroom.user2.id, chatroom_id: chatroom.id)
end

puts "Messages successfully created"



# Create 20 users
puts "Creating babysitters.."
# Define arrays of possible values
first_names = ["Alice", "Bob", "Charlie", "Dave", "Emma", "Frank", "Grace", "Henry", "Isabella", "Jack"]
last_names = ["Adams", "Brown", "Clark", "Davis", "Edwards", "Foster", "Garcia", "Hernandez", "Ingram", "Jackson"]
genders = ["Male", "Female"]
addresses = ["123 Main St.", "456 Elm St.", "789 Maple Ave.", "1011 Oak Rd.", "1213 Pine Blvd.", "1415 Cedar Ln.", "1617 Walnut St.", "1819 Spruce Dr.", "2021 Birch Ave.", "2223 Poplar Rd."]
costs_per_hour = [10.0, 12.5, 15.0, 17.5, 20.0]
years_of_experience = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
image_paths = ["assets/bbs1.jpeg", "assets/bbs2.jpeg", "assets/bbs3.jpeg", "assets/bbs4.jpeg", "assets/bbs5.jpeg", "assets/bbs6.jpeg", "assets/bbs7.jpeg", "assets/bbs8.jpeg", "assets/bbs8.jpeg", "assets/bbs9,jpeg"]


# Create 10 Babysitter records
10.times do |i|
  user = User.create!(
    email: "babysitter#{i + 1}@example.com",
    password: "password"
  )

  Babysitter.create!(
    first_name: first_names[i % 10],
    last_name: last_names[i % 10],
    age: 18 + (i % 13),
    gender: genders[i % 2],
    address: addresses[i % 10],
    cost_per_hour: costs_per_hour[i % 5],
    years_of_experience: years_of_experience[i % 11],
    image: image_paths.sample,
    user: user
  )
end
puts "babysitters successfully created"
