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

item1 = john.items.create!(
  name: "Baby rattle",
  description: "A colorful plastic rattle for babies",
  age: "1",
  house: "Herman Str.5",
  available: true,
  user_id: User.last.id
)
p item1
image_item1 = URI.open("https://www.verywellfamily.com/thmb/oAmzoovzj0HqQmprnm9KkwueGJ4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Best-Baby-Rattles-VWF-tout-281a53fe25764897ad227834f014e655.jpg")
item1.image.attach(io: image_item1, filename: "item1.jpg")
item1.image.analyze
item1.image.metadata["public_id"] = Cloudinary::Uploader.upload(item1.image.blob.url, resource_type: :auto)["public_id"]
item1.save

item2 = felix.items.create!(
  name: "Toddler shoes",
  description: "A pair of used toddler shoes in good condition",
  age: "3",
  house: "Eisenacher Str.7",
  available: true,
  user_id: User.last.id
)
p item2
image_item2 = URI.open("https://i.ebayimg.com/images/g/esAAAOSwJdRhpPQD/s-l500.jpg")
item2.image.attach(io: image_item2, filename: "item2.jpg")
item2.image.analyze
item2.image.metadata["public_id"] = Cloudinary::Uploader.upload(item2.image.blob.url, resource_type: :auto)["public_id"]
item2.save

item3 = jane.items.create!(
  name: "Baby clothes",
  description: "A bag of gently used baby clothes",
  age: "2",
  house: "Wittineu Str.17",
  available: true,
  user_id: User.last.id
)
p item3
image_item3 = URI.open("https://www.sassymamasg.com/wp-content/uploads/2021/11/kids-clothes-babies-singapore-poney.jpeg")
item3.image.attach(io: image_item3, filename: "item3.jpg")
item3.image.analyze
item3.image.metadata["public_id"] = Cloudinary::Uploader.upload(item3.image.blob.url, resource_type: :auto)["public_id"]
item3.save

item4 = norma.items.create!(
  name: "Potty seat",
  description: "A used potty seat in good condition",
  age: "1",
  house: "Senftenberger 17",
  available: true,
  user_id: User.last.id
)
p item4
image_item4 = URI.open("https://media-www.canadiantire.ca/product/fixing/plumbing/faucets-fixtures/0631048/children-s-potty-seat-75f8a6df-590e-4147-9da1-758f491bb969.png")
item4.image.attach(io: image_item4, filename: "item4.jpg")
item4.image.analyze
item4.image.metadata["public_id"] = Cloudinary::Uploader.upload(item4.image.blob.url, resource_type: :auto)["public_id"]
item4.save

item5 = john.items.create!(
  name: "Stroller",
  description: "A used stroller in good condition",
  age: "2",
  house: "Karl-Marx-Str. 8",
  available: true,
  user_id: User.last.id
)
p item5
image_item5 = URI.open("https://media.4rgos.it/i/Argos/8440442_R_Z001A?w=750&h=440&qlt=70")
item5.image.attach(io: image_item5, filename: "item5.jpg")
item5.image.analyze
item5.image.metadata["public_id"] = Cloudinary::Uploader.upload(item5.image.blob.url, resource_type: :auto)["public_id"]
item5.save

item6 = felix.items.create!(
  name: "Crib",
  description: "A wooden crib in excellent condition",
  age: "1",
  house: "Rosa-Luxemburg-Str. 15",
  available: true,
  user_id: User.last.id
)
p item6
image_item6 = URI.open("https://assets.pkimgs.com/pkimgs/ab/images/dp/wcm/202253/0240/west-elm-x-pbk-mid-century-convertible-crib-1-c.jpg")
item6.image.attach(io: image_item6, filename: "item6.jpg")
item6.image.analyze
item6.image.metadata["public_id"] = Cloudinary::Uploader.upload(item6.image.blob.url, resource_type: :auto)["public_id"]
item6.save

item7 = jane.items.create!(
  name: "Breast pump",
  description: "A used breast pump in good condition",
  age: "1",
  house: "Schlesische Str. 20",
  available: true,
  user_id: User.last.id
)
p item7
image_item7 = URI.open("https://m.media-amazon.com/images/I/81eryoA2dPL._SL1500_.jpg")
item7.image.attach(io: image_item7, filename: "item7.jpg")
item7.image.analyze
item7.image.metadata["public_id"] = Cloudinary::Uploader.upload(item7.image.blob.url, resource_type: :auto)["public_id"]
item7.save

item8 = norma.items.create!(
  name: "Baby monitor",
  description: "A used baby monitor in good condition",
  age: "2",
  house: "Kastanienallee 36",
  available: true,
  user_id: User.last.id
)
p item8
image_item8 = URI.open("https://media.wired.com/photos/5c490e5ac2835a2c29c0dc92/191:100/w_2580,c_limit/eufybaby.jpg")
item8.image.attach(io: image_item8, filename: "item8.jpg")
item8.image.analyze
item8.image.metadata["public_id"] = Cloudinary::Uploader.upload(item8.image.blob.url, resource_type: :auto)["public_id"]
item8.save

item9 = rodrigo.items.create!(
  name: "Baby swing",
  description: "A used baby swing in good condition",
  age: "1",
  house: "Auguststr. 45",
  available: true,
  user_id: User.last.id
)
p item9
image_item9 = URI.open("https://www.takatomo.de/media/catalog/product/s/o/solvej-swings-schaukel-dunkelgrau-4.jpg")
item9.image.attach(io: image_item9, filename: "item9.jpg")
item9.image.analyze
item9.image.metadata["public_id"] = Cloudinary::Uploader.upload(item9.image.blob.url, resource_type: :auto)["public_id"]
item9.save

item10 = john.items.create!(
  name: "Baby bath tub",
  description: "A sturdy plastic baby bath tub with built-in seat and drain plug",
  age: "1",
  house: "Herman Str.5",
  available: true,
  user_id: User.last.id
)
p item10
image_item10 = URI.open("https://rukminim1.flixcart.com/image/416/416/kzzw5u80/bath-tub/v/i/y/swimming-pool-inflatable-baby-bath-tub-pool-summer-indoor-original-imagbw4ygc9thyhg.jpeg?q=70")
item10.image.attach(io: image_item10, filename: "item10.jpg")
item10.image.analyze
item10.image.metadata["public_id"] = Cloudinary::Uploader.upload(item10.image.blob.url, resource_type: :auto)["public_id"]
item10.save

item11 = felix.items.create!(
  name: "Baby high chair",
  description: "A sturdy and adjustable high chair suitable for infants and toddlers",
  age: "2",
  house: "Eisenacher Str.7",
  available: true,
  user_id: User.last.id
)
p item11
image_item11 = URI.open("https://media.sketchfab.com/models/92f82f6db6d04e5dae037df20273c506/thumbnails/70b24082258f4a8a85138892527f1480/1504e5fd1bf541deba6d5650df59fb92.jpeg")
item11.image.attach(io: image_item11, filename: "item11.jpg")
item11.image.analyze
item11.image.metadata["public_id"] = Cloudinary::Uploader.upload(item11.image.blob.url, resource_type: :auto)["public_id"]
item11.save

item12 = jane.items.create!(
  name: "Baby play mat",
  description: "A soft and colorful play mat for babies with detachable toys",
  age: "1",
  house: "Wittenau Str.17",
  available: true,
  user_id: User.last.id
)
p item12
image_item12 = URI.open("https://www.parents.com/thmb/o5wvuIisbeuGw20qlQK1EdQ41kE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/sassy-stages-stem-developmental-play-gym-tout-2000-1dce6dd0f0054cbdb91844e6d30be2af.jpg")
item12.image.attach(io: image_item12, filename: "item12.jpg")
item12.image.analyze
item12.image.metadata["public_id"] = Cloudinary::Uploader.upload(item12.image.blob.url, resource_type: :auto)["public_id"]
item12.save

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
    user: user
  )
end
