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

puts "Deleting babysitters..."

Babysitter.destroy_all

puts "Deleting items..."

Item.destroy_all

puts "Deleting Events..."

Event.destroy_all

puts "Creating Users..."

users = []

john = User.create(email: 'john@example.com',
  password: '123456',
  first_name: 'John',
  last_name: 'Doe',
  address: 'Berliner Allee 125',
  gender: "Male")

john.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098718/d4f1w05kkbpee3sctons.jpg'), filename: 'profile1.jpg', content_type: 'image/jpg')
p john
users << john

felix = User.create(email: 'felix@example.com',
  password: '123456',
  first_name: 'Felix',
  last_name: 'Baumgartner',
  address: 'Rosa Luxemburg Str. 84',
  gender: "Male")

felix.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098713/ikvov8istpbwhcf0k9tg.jpg'), filename: 'profile2.jpg', content_type: 'image/jpg')
p felix
users << felix

jane = User.create(email: 'jane@example.com',
  password: '123456',
  first_name: 'Jane',
  last_name: 'Jackson',
  address: 'Simon Bolivar Str. 52',
  gender: "Female")

jane.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098708/aqfxtwzil5kqpqb2k740.jpg'), filename: 'profile3.jpg', content_type: 'image/jpg')
p jane
users << jane

norma = User.create(email: 'norma@example.com',
  password: '123456',
  first_name: 'Norma',
  last_name: 'Baker',
  address: 'Sonnenalle 785',
  gender: "Female")

norma.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098703/opaimkxebgsw1ld2gosw.jpg'), filename: 'profile4.jpg', content_type: 'image/jpg')
p norma
users << norma

rodrigo = User.create(email: 'rodrigo@example.com',
  password: '123456',
  first_name: 'Rodrigo',
  last_name: 'Mueller',
  address: 'Schönhauser Allee 77',
  gender: "Other")

rodrigo.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098439/ucuf0ijqdn74bbxgzcg9.jpg'), filename: 'profile5.jpg', content_type: 'image/jpg')
p rodrigo
users << rodrigo

puts "Users creation completed successfuly"

puts "Creating Items.."

item1 = john.items.create!(
  name: "Baby rattle",
  description: "A colorful plastic rattle for babies",
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
  age: Item::AGES.shuffle[0],
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
genders = ["Female", "Female", "Female"]
addresses = ["Schönhauser Allee 26A, 10435 Berlin", "Immanuelkirchstraße 14A, 10405 Berlin", "Bartningallee 29, 10557 Berlin", "Beusselstraße 61, 10553 Berlin", "Friedrich-Olbricht-Damm 66, 13627 Berlin", "Ohmstraße 4-6, 13629 Berlin", "Zehlendorfer Damm 121, 14532 Berlin", "Ruhlsdorfer Str. 95, 14532 Berlin", "Am Rain 12, 13591 Berlin, Germany", "Johannisthaler Chaussee 317, 12351 Berlín, Alemania"]
costs_per_hour = [10.0, 12.5, 15.0, 17.5, 20.0]
years_of_experience = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
image_paths = [
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684576/pexels-photo-774909_kkqjgd.jpg",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684546/bbysitter8_vxhlkb.jpg",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684534/bbysitter7_oh2jpf.webp",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684523/bbysitter6_plhyf6.webp",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684512/bbs2_chvgbj.webp",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684497/bbs1_j2rglu.jpg",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684479/basitter5_b4qys3.webp",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680269286/development/0tvh27st2cftr688nzogenl4q3f8.png",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684434/baby.setter1_u54lxy.jpg",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680696646/pexels-photo-1499327_pfelku.jpg"
]

# Create 10 Babysitter records
10.times do |i|
  user = User.create!(
    email: "babysitter#{i + 1}@example.com",
    password: "password",
    first_name: first_names[i % 10],
    last_name: last_names[i % 10],
    gender: genders[i % 2],
    address: addresses[i % 10]
  )
  puts i
  # Download a random image from the internet and upload it to Cloudinary
  file = image_paths[i]
  puts "trying to add #{file}"
  user.image.attach(io: URI.open(file), filename: "image.jpg")

puts "image added to user"

bio_name = user.first_name

bios = [" Hi there! I'm #{bio_name}, an experienced babysitter with CPR certification. I've cared for children of all ages and enjoy playing games, reading stories, and creating fun activities. I'm available on evenings and weekends and can't wait to meet your little ones!",
  "Hello, I'm #{bio_name}! I'm a fun and energetic caregiver with a background in early childhood education. I love spending time outdoors, doing arts and crafts, and engaging kids in imaginative play. I have experience working with children with special needs and always prioritize safety and fun!",
"Hey, I'm #{bio_name}! I'm a responsible and reliable sitter with experience caring for infants to teenagers. I love playing sports, doing puzzles, and creating DIY projects with kids. I'm also comfortable with meal prep, light housekeeping, and homework help. Let's have some fun together!"]

puts "babysitters successfully created"
  babysitter= Babysitter.create!(
    first_name: first_names[i % 10],
    last_name: last_names[i % 10],
    age: 18 + (i % 13),
    gender: genders[i % 2],
    address: addresses[i % 10],
    cost_per_hour: costs_per_hour[i % 5],
    years_of_experience: years_of_experience[i % 11],
    user: user,
    bio: bios[i % 3]
  )
  babysitter.image.attach(io: URI.open(file), filename: "image.jpg")
  babysitter.save!
end
puts "babysitters successfully created"

puts "Creating Events.."

event1 = john.events.create!(
  name: 'Berlin Zoo Day Trip',
  description: 'Join us for a day at the Berlin Zoo! Get up close and personal with lions, tigers, and bears (oh my!), as well as a wide variety of other fascinating creatures from all around the world.',
  address: 'Simon-Dach-Straße 43, 10245 Berlin, Germany',
  cost: 20.00,
  category: 'Animals & Nature',
  date: '2023-05-06',
  user_id: User.all.sample.id
)
p event1
image_event1 = URI.open("https://i.ytimg.com/vi/rvYvxiJB150/maxresdefault.jpg")
event1.image.attach(io: image_event1, filename: "event1.jpg")
event1.image.analyze
event1.image.metadata["public_id"] = Cloudinary::Uploader.upload(event1.image.blob.url, resource_type: :auto)["public_id"]
event1.save

event2 = jane.events.create!(
  name: "Kids' Pottery Workshop",
  description: 'Bring your little ones to learn the art of pottery! Our expert instructor will guide them through the process of creating their own unique pieces, which they can take home and show off to their friends.',
  address: 'Mehringdamm 50, 10961 Berlin, Germany',
  cost: 15.00,
  category: 'Arts & Crafts',
  date: '2023-04-22',
  user_id: User.all.sample.id
)
p event2
image_event2 = URI.open("https://assets.website-files.com/5defbfd220b40f28dec337ba/5fbeb0dff757755589766126_iStock-1014754398.jpg")
event2.image.attach(io: image_event2, filename: "event2.jpg")
event2.image.analyze
event2.image.metadata["public_id"] = Cloudinary::Uploader.upload(event2.image.blob.url, resource_type: :auto)["public_id"]
event2.save

event3 = jane.events.create!(
  name: 'Theater for Kids: The Little Mermaid',
  description: 'Experience the magic of live theater with your kids! Join us for a special performance of "The Little Mermaid" at the Berliner Ensemble Theater. With stunning sets, costumes, and talented actors, this show is sure to delight audiences of all ages.',
  address: 'Unter Den Linden 100, 10117 Berlin, Germany',
  cost: 18.00,
  category: 'Performing Arts',
  date: '2023-04-30',
  user_id: User.all.sample.id
)
p event3
image_event3 = URI.open("https://www.clarkcountytoday.com/wp-content/uploads/2022/07/story_Clark-County-Today-Little-Mermaid-Cast-Journey.jpg")
event3.image.attach(io: image_event3, filename: "event3.jpg")
event3.image.analyze
event3.image.metadata["public_id"] = Cloudinary::Uploader.upload(event3.image.blob.url, resource_type: :auto)["public_id"]
event3.save

event4 = rodrigo.events.create!(
  name: 'Kids Yoga Class',
  description: 'Introduce your children to the benefits of yoga! Join us for a fun and engaging yoga class designed specifically for kids. Our certified instructor will guide them through a series of poses and breathing exercises that will help improve their flexibility, balance, and mindfulness.',
  address: 'Görlitzer Straße 20, 10997 Berlin, Germany',
  cost: 10.00,
  category: 'Fitness & Wellness',
  date: '2023-06-03',
  user_id: User.all.sample.id
)
p event4
image_event4 = URI.open("https://www.hairu.de/app/uploads/2020/10/Kids-aspect-ratio-660-420-1.jpg")
event4.image.attach(io: image_event4, filename: "event4.jpg")
event4.image.analyze
event4.image.metadata["public_id"] = Cloudinary::Uploader.upload(event4.image.blob.url, resource_type: :auto)["public_id"]
event4.save

event5 = norma.events.create!(
  name: 'Kids Science Workshop',
  description: 'Get your kids excited about science with our fun and interactive workshop! Our experienced instructor will lead your children through a series of hands-on experiments and activities that will teach them about the wonders of the natural world. From making volcanoes to exploring the properties of different materials, this workshop is sure to ignite their curiosity and imagination.',
  address: 'Kottbusser Straße 50, 10999 Berlin, Germany',
  cost: 25.00,
  category: 'Science & Technology',
  date: '2023-05-20',
  user_id: User.all.sample.id
)
p event5
image_event5 = URI.open("https://currituck.ces.ncsu.edu/wp-content/uploads/2020/12/12658902_xl.jpg")
event5.image.attach(io: image_event5, filename: "event5.jpg")
event5.image.analyze
event5.image.metadata["public_id"] = Cloudinary::Uploader.upload(event5.image.blob.url, resource_type: :auto)["public_id"]
event5.save

event6 = felix.events.create!(
  name: 'Kids Baking Class',
  description: 'Calling all aspiring bakers! Join us for a fun and educational baking class designed just for kids. Our expert instructor will guide your children through the process of making delicious treats, from cupcakes to cookies and more. They will learn valuable skills such as measuring, mixing, and decorating, all while having a blast in the kitchen.',
  address: 'Pestalozzistraße 32, 10627 Berlin, Germany',
  cost: 20.00,
  category: 'Food & Drink',
  date: '2023-05-15',
  user_id: User.all.sample.id
)
p event6
image_event6 = URI.open("https://www.littlelondonmagazine.co.uk/wp-content/uploads/kids-baking.jpg")
event6.image.attach(io: image_event6, filename: "event6.jpg")
event6.image.analyze
event6.image.metadata["public_id"] = Cloudinary::Uploader.upload(event5.image.blob.url, resource_type: :auto)["public_id"]
event6.save

event7 = jane.events.create!(
  name: 'Art Workshop for Kids',
  description: 'Unleash your child’s creativity at our art workshop! Our experienced instructor will teach them how to create their own masterpieces using various techniques and mediums. They will have fun, learn new skills, and take home their own unique artwork.',
  address: 'Prenzlauer Allee 242, 10405 Berlin, Germany',
  cost: 25.00,
  category: 'Arts & Crafts',
  date: '2023-05-08',
  user_id: User.all.sample.id
)
p event7
image_event7 = URI.open("https://www.italysbestrome.com/wp-content/uploads/2016/06/Creative-art-workshops-Rome.jpg")
event7.image.attach(io: image_event7, filename: "event7.jpg")
event7.image.analyze
event7.image.metadata["public_id"] = Cloudinary::Uploader.upload(event7.image.blob.url, resource_type: :auto)["public_id"]
event7.save

event8 = felix.events.create!(
  name: 'Kids Cooking Class',
  description: 'Bring your little chefs to our cooking class and let them learn how to make delicious and healthy meals! Our professional chef will guide them through the process of preparing a meal, from choosing ingredients to cooking techniques. They will have fun, learn new skills and, most importantly, taste their creations!',
  address: 'Paul-Lincke-Ufer 44, 10999 Berlín, Germany',
  cost: 30.00,
  category: 'Food & Drink',
  date: '2023-05-15',
  user_id: User.all.sample.id
)
p event8
image_event8 = URI.open("https://balwyncc.org.au/wp-content/uploads/2020/08/kids-cooking-snip.png")
event8.image.attach(io: image_event8, filename: "event8.jpg")
event8.image.analyze
event8.image.metadata["public_id"] = Cloudinary::Uploader.upload(event8.image.blob.url, resource_type: :auto)["public_id"]
event8.save

puts "Events successfully created"
