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
  address: 'Auguststraße 22, 10117 Berlin, Germany',
  gender: "Non Binary")

rodrigo.image.attach(io: URI.open('https://res.cloudinary.com/dgtys3cw2/image/upload/v1680098439/ucuf0ijqdn74bbxgzcg9.jpg'), filename: 'profile5.jpg', content_type: 'image/jpg')
p rodrigo
users << rodrigo

puts "Users creation completed successfuly"

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

# Create 30 users
puts "Creating babysitters and items.."
# Define arrays of possible values
first_names = ["Alice", "Bob", "Charlie", "Dave", "Emma", "Frank", "Grace", "Henry", "Isabella", "Jack", "Katie", "Liam", "Maggie", "Nathan", "Olivia", "Patrick", "Quinn", "Rachel", "Samuel", "Tina", "Una", "Vera", "William", "Xavier", "Yvonne", "Zachary", "Aaron", "Beth", "Caleb", "Diana"]

last_names = ["Adams", "Brown", "Clark", "Davis", "Edwards", "Foster", "Garcia", "Hernandez", "Ingram", "Jackson", "Kim", "Lee", "Martinez", "Nelson", "O'Connor", "Patel", "Quinn", "Rodriguez", "Singh", "Taylor", "Upton", "Vargas", "White", "Xu", "Yoder", "Zhang", "Anderson", "Baker", "Carter", "Diaz"]

genders = ["Female", "Female", "Female"]

ratings = [5, 4, 3, 2, 1]

addresses = [
  "Schönhauser Allee 26a, 10435 Berlin, Germany",
  "Immanuelkirchstraße 14A, 10405 Berlin, Germany",
  "Bartningallee 29, 10557 Berlin, Germany",
  "Beusselstraße 61, 10553 Berlin",
  "Friedrich-Olbricht-Damm 66, 13627 Berlin, Germany",
  "Ohmstraße 4-6, 13629 Berlin, Germany",
  "Zehlendorfer Damm 121, 14532 Berlin, Germany",
  "Ruhlsdorfer Str. 95, 14532 Berlin, Germany",
  "Am Rain 12, 13591 Berlin, Germany",
  "Johannisthaler Chaussee 317, 12351 Berlin, Germany",
  "Gleimstraße 40, 10437 Berlin, Germany",
  "Kopenhagener Str. 72, 10437 Berlin, Germany",
  "Pappelallee 76, 10437 Berlin, Germany",
  "Prenzlauer Allee 87, 10405 Berlin, Germany",
  "Marienburger Str. 16, 10405 Berlin, Germany",
  "Dunckerstraße 68, 10439 Berlin, Germany",
  "Stargarder Str. 64, 10437 Berlin, Germany",
  "Lychener Str. 50, 10437 Berlin, Germany",
  "Greifswalder Str. 87, 10409 Berlin, Germany",
  "Greifswalder Str. 39, 10405 Berlin, Germany",
  "Danziger Str. 38, 10435 Berlin, Germany",
  "Landsberger Allee 203, 13055 Berlin, Germany",
  "Petersburger Str. 72, 10247 Berlin, Germany",
  "Sonnenallee 67, 12045 Berlin, Germany",
  "Hobrechtstraße 66, 12047 Berlin, Germany",
  "Kottbusser Damm 95, 10967 Berlin, Germany",
  "Oranienstraße 142, 10969 Berlin, Germany",
  "Warschauer Str. 33, 10243 Berlin, Germany",
  "Frankfurter Allee 111, 10247 Berlin, Germany",
  "Karl-Marx-Allee 93, 10243 Berlin, Germany"
]
costs_per_hour = [10.0, 12.5, 15.0, 17.5, 20.0]
years_of_experience = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
image_paths = [
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684576/pexels-photo-774909_kkqjgd.jpg",
  "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80",
  "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/1300402/pexels-photo-1300402.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684512/bbs2_chvgbj.webp",

  "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684479/basitter5_b4qys3.webp",
  "https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3.png",
  "https://res.cloudinary.com/dah2xuhge/image/upload/v1680684434/baby.setter1_u54lxy.jpg",
  "https://www.perfocal.com/blog/content/images/2020/07/Perfocal_Male_Dating_Profile.jpg",

  "https://res.cloudinary.com/do01ayalz/image/upload/v1681887818/pexels-photo-415829_cg26mv.jpg",
  "https://t4.ftcdn.net/jpg/03/98/85/77/360_F_398857704_n44BPhqM68Xk9vT31BeFkLQwWsgeZS6C.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681887802/pexels-photo-3763188_z4p8yl.jpg",
  "https://media.istockphoto.com/id/1258168119/photo/profile-picture-of-smiling-male-employee-posing-at-workplace.jpg?s=612x612&w=0&k=20&c=2jo-LMcqRoP-krKmZnPDk9ezJQWCnSfbFXcshtzRTxE=",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681887784/pexels-photo-3775540_jci3e0.jpg",

  "https://media.istockphoto.com/id/1473016495/photo/closeup-portrait-of-confident-business-man-posing-looking-at-camera.jpg?s=612x612&w=0&k=20&c=sREpXAPmOfuU1XOZfrwvT5RjCB5aW-xM-M5ATABH7f0=",
  "https://t3.ftcdn.net/jpg/04/73/11/56/360_F_473115635_ut9ET35Sb5Q0bVNqErYU1qQehlhfJpkY.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681887683/ef1bbbf6dff0c90864d83b252ac689c0_in6jo9.jpg",
  "https://t3.ftcdn.net/jpg/01/95/87/04/360_F_195870457_ikd3O9QHsLHtqwK92Mynk3Mdq37Qji1H.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681887651/amazing-woman-portrait-beautiful-girl-model-fashion_shyxkl.jpg",

  "https://res.cloudinary.com/do01ayalz/image/upload/v1681887637/young-beautiful-woman-on-light-background_yt5edi.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681887618/studio-shot-of-young-beautiful-woman_c1nokw.jpg",
  "https://t4.ftcdn.net/jpg/02/05/57/31/360_F_205573127_717UojzrGbQjHC4Ctn06kFjoZ7Hl6oX3.webp",
  "https://t4.ftcdn.net/jpg/03/54/18/79/360_F_354187986_PLWm3c9JJJW48Wu8yUbaUnldmOaimIY2.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681887540/wallpaper2you_514211_tavf1x.jpg",

  "https://t4.ftcdn.net/jpg/04/30/27/41/360_F_430274102_sEWTZoMpY1NCGd6hDH7Ns4vLykDPOck7.jpg",
  "https://www.slazzer.com/blog/wp-content/uploads/2022/11/Professional-Profile-Picture-1.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681822472/portrait-of-a-beautiful-young-woman-outdoor_x95oy9.jpg",
  "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681822307/360_F_187145146_SB34n4kdiNqlVSvaTy4YUJcUWjNO540N_sbh3w5.jpg"
]
image_items = [
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681993094/items/Best-Baby-Rattles-VWF-tout-281a53fe25764897ad227834f014e655_ynanyb.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681993661/items/s-l500_suipou.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682006569/items/kids-clothes-babies-singapore-poney_tpw8ji.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681995726/items/children-s-potty-seat-75f8a6df-590e-4147-9da1-758f491bb969_qbznw4.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1681995785/items/8440442_R_Z001A_ilzvvv.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682002950/items/west-elm-x-pbk-mid-century-convertible-crib-1-c_rlpr9l.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682002998/items/81eryoA2dPL._SL1500__ey4trz.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003048/items/eufybaby_k2zilh.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003134/items/solvej-swings-schaukel-dunkelgrau-4_btm1b6.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003243/items/swimming-pool-inflatable-baby-bath-tub-pool-summer-indoor-original-imagbw4ygc9thyhg_gdk5eh.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003341/items/1504e5fd1bf541deba6d5650df59fb92_xl4twa.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003366/items/sassy-stages-stem-developmental-play-gym-tout-2000-1dce6dd0f0054cbdb91844e6d30be2af_lts66l.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003396/items/S1f1160cd05f647caaffb787c7d17151fD_600x_f6imv7.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003425/items/product-steam-sterilizer-4_vao6tl.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003457/items/395500-convertible-car-seats-essentials-by-britax-allegiance-61074_rewibm.png",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003488/items/deuce3_solo-rangergreen_1600x_pxddvm.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003534/items/nattou-silicone-teether-ring-ochre_bfksc7.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003571/items/image_guixkp.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003611/items/7463wcmqc4c11_tbwnmy.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682003697/items/920311_product_amb_1_lfiufl.jpg",
  "https://images.cdn.babyartikel.de/large/julius-zollner-stillkissen-mikroperlen-fullung-inkl-bezug-190-cm-musselin-grun-4677055607-d0.jpg",
  "https://cdn.shopify.com/s/files/1/0705/2695/9924/products/IMG_1273_b3e17de6-5296-4316-81e5-5567c9a51dd5.jpg?v=1673015796",
  "https://media.donedeal.ie/eyJidWNrZXQiOiJkb25lZGVhbC5pZS1waG90b3MiLCJlZGl0cyI6eyJ0b0Zvcm1hdCI6ImpwZWciLCJyZXNpemUiOnsiZml0IjoiY292ZXIiLCJ3aWR0aCI6NjAwLCJoZWlnaHQiOjQ1MH19LCJrZXkiOiJwaG90b18yNTUwMjQ3OTYifQ==?signature=73d7ed9001b8d663317ae89cc6e27aa9fa6e2b93729bd3cf40e1c5d6b3906e37",
  "https://mumsgrapevine.com.au/site/wp-content/uploads/2020/12/Euky-Bear-Sweet-Dreams-Aid-Humidifier-v4.jpg",
  "https://cdn.shopify.com/s/files/1/2275/1757/products/view3_5003a047-401b-4864-8cdd-5a4ea24db32f_1050x700.jpg?v=1551810074",
  "https://i.ebayimg.com/images/g/o4gAAOSwik1fkhwY/s-l1600.jpg",
  "https://media.istockphoto.com/id/147708280/photo/purple-baby-bib.jpg?s=612x612&w=0&k=20&c=NNvdwzAPEzv-fyss7pJ0et-MWfM_pKVCnLz6AvSn4-I=",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682005992/items/set-1_wolli_double_beige_fesegh.webp",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682006043/items/m_63d16a7517e49c2dbd4afe31_ylt33k.jpg",
  "https://res.cloudinary.com/do01ayalz/image/upload/v1682006074/items/81b_-qUV9CL_bf41fm.jpg"
]
names = [
  "Baby rattle",
  "Toddler shoes",
  "Baby clothes",
  "Potty seat",
  "Stroller",
  "Crib",
  "Breast pump",
  "Baby monitor",
  "Baby swing",
  "Baby bath tub",
  "Baby high chair",
  "Baby play mat",
  "Baby carrier",
  "Baby bottle sterilizer",
  "Convertible car seat",
  "Diaper bag",
  "Baby teething toys",
  "Baby wrap carrier",
  "Baby activity center",
  "Baby nasal aspirator",
  "Nursing pillow",
  "Swaddle blankets",
  "Baby food maker",
  "Baby humidifier",
  "Baby nail clippers",
  "Baby thermometer",
  "Baby bibs",
  "Baby Bouncer",
  "Baby Sleep Sack",
  "Baby First Aid Kit"
]
descriptions = [
  "A colorful plastic rattle for babies",
  "A pair of used toddler shoes in good condition",
  "A bag of gently used baby clothes",
  "A used potty seat in good condition",
  "A used stroller in good condition",
  "A wooden crib in excellent condition",
  "A used breast pump in good condition",
  "A used baby monitor in good condition",
  "A used baby swing in good condition",
  "A sturdy plastic baby bath tub with built-in seat and drain plug",
  "A sturdy and adjustable high chair suitable for infants and toddlers",
  "A soft and colorful play mat for babies with detachable toys",
  "A comfortable and ergonomic baby carrier for parents to carry their infants",
  "An electric sterilizer for baby bottles, pacifiers, and breast pump parts",
  "A car seat that can be converted from rear-facing to forward-facing as the child grows",
  "A stylish and functional diaper bag with multiple pockets and compartments",
  "A set of soft and chewy teething toys to soothe your baby's sore gums",
  "A stretchy and versatile wrap carrier to keep your baby close and your hands free",
  "An interactive play center with music, lights, and toys to keep your baby entertained",
  "A safe and effective way to clear your baby's stuffy nose",
  "Supports feeding position and reduces strain on parent's arms, neck, and back",
  "Create a cozy and secure environment for baby, helps soothe fussy babies",
  "Prepares homemade baby food easily, allowing parents to control ingredients and quality",
  "Adds moisture to air, relieves dry skin and congestion, helps prevent respiratory infections",
  "Safely trims baby's delicate nails to prevent accidental cuts or injury",
  "Measures baby's temperature, important for detecting illness or infection",
  "Protects baby's clothes from spills, drool, and food stains",
  "Gently bounces to soothe and entertain baby, suitable from newborn to toddler age",
  "Wearable blanket keeps baby warm and secure while sleeping, safer alternative to loose blankets",
  "Contains essential items for minor injuries and illnesses, helpful in emergencies"
]

# Create 10 Babysitter records
30.times do |i|
  user = User.create!(
    email: "babysitter#{i + 1}@example.com",
    password: "password",
    first_name: first_names[i % 30],
    last_name: last_names[i % 30],
    gender: genders[i % 2],
    address: addresses[i % 30]
  )
  puts i
  # Download a random image from the internet and upload it to Cloudinary
  file = image_paths[i]
  doc = image_items[i]
  puts "trying to add #{file}"
  user.image.attach(io: URI.open(file), filename: "image.jpg")

  puts "image added to user"

  bio_name = user.first_name

  bios = [" Hi there! I'm #{bio_name}, an experienced babysitter with CPR certification. I've cared for children of all ages and enjoy playing games, reading stories, and creating fun activities. I'm available on evenings and weekends and can't wait to meet your little ones!",
    "Hello, I'm #{bio_name}! I'm a fun and energetic caregiver with a background in early childhood education. I love spending time outdoors, doing arts and crafts, and engaging kids in imaginative play. I have experience working with children with special needs and always prioritize safety and fun!",
  "Hey, I'm #{bio_name}! I'm a responsible and reliable sitter with experience caring for infants to teenagers. I love playing sports, doing puzzles, and creating DIY projects with kids. I'm also comfortable with meal prep, light housekeeping, and homework help. Let's have some fun together!"]

  puts "babysitters successfully created"
  babysitter= Babysitter.create!(
    first_name: first_names[i % 30],
    last_name: last_names[i % 30],
    age: 18 + (i % 13),
    gender: genders[i % 2],
    address: addresses[i % 30],
    cost_per_hour: costs_per_hour[i % 5],
    years_of_experience: years_of_experience[i % 11],
    user: user,
    bio: bios[i % 3]
  )
  babysitter.image.attach(io: URI.open(file), filename: "image.jpg")
  babysitter.save!
  rand(100).times { Review.new(rating: ratings[rand(4)], babysitter: babysitter, user: User.all.sample).save! }

  puts "Creating Items.."

  item = Item.create!(
    name: names[i % 30],
    description: descriptions[i % 30],
    age: Item::AGES.shuffle[0],
    available: true,
    user: user,
  )
  item.image.attach(io: URI.open(doc), filename: "image.jpg")
  item.save!

  puts "Items created successfully"
end

puts "babysitters and items successfully created"

puts "Creating Events.."

event1 = john.events.create!(
  name: 'Berlin Zoo Day Trip',
  description: 'Join us for a day at the Berlin Zoo! Get up close and personal with lions, tigers, and bears (oh my!), as well as a wide variety of other fascinating creatures from all around the world.',
  address: 'Hardenbergpl. 8, 10787 Berlin, Germany',
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

event9 = felix.events.create!(
  name: 'Kids Painting Workshop',
  description: 'Join us for a fun-filled painting workshop for kids! Our experienced art instructor will teach them how to paint a beautiful picture using acrylic paints. The kids will have a great time and take home their own masterpiece!',
  address: 'Kopenhagener Str. 46, 10437 Berlin, Germany',
  cost: 25.00,
  category: 'Arts & Crafts',
  date: '2023-06-01',
  user_id: User.all.sample.id
)
p event9
image_event9 = URI.open("https://handsonart4everyone.com/wp-content/uploads/2018/01/Cruise-Mexico-2015-055-scaled.jpg")
event9.image.attach(io: image_event9, filename: "event9.jpg")
event9.image.analyze
event9.image.metadata["public_id"] = Cloudinary::Uploader.upload(event9.image.blob.url, resource_type: :auto)["public_id"]
event9.save

event10 = felix.events.create!(
  name: 'Kids Sports Day',
  description: 'Bring your little athletes to our sports day event! We have a range of fun sports activities planned for the kids including soccer, basketball, and relay races. The event is designed to encourage kids to be active, healthy and have fun with their peers.',
  address: 'Kastanienallee 82, 10435 Berlin, Germany',
  cost: 20.00,
  category: 'Sports & Fitness',
  date: '2023-06-15',
  user_id: User.all.sample.id
)
p event10
image_event10 = URI.open("https://media.istockphoto.com/id/466335022/de/foto/raum-hopper-challenge.jpg?s=612x612&w=0&k=20&c=hHk3u0frACFEY4WkyAveUEQF92psXlkWIrN_EQELE7g=")
event10.image.attach(io: image_event10, filename: "event10.jpg")
event10.image.analyze
event10.image.metadata["public_id"] = Cloudinary::Uploader.upload(event10.image.blob.url, resource_type: :auto)["public_id"]
event10.save

event11 = felix.events.create!(
  name: 'Kids Movie Night',
  description: 'Join us for a fun night of movies and snacks for kids! We will be screening a selection of family-friendly movies, and the kids can enjoy popcorn, candy, and other treats. Parents can relax and enjoy the movie with their kids.',
  address: 'Oranienburger Str. 18, 10178 Berlin, Germany',
  cost: 10.00,
  category: 'Entertainment',
  date: '2023-07-02',
  user_id: User.all.sample.id
)
p event11
image_event11 = URI.open("https://uoe.com/wp-content/uploads/2018/04/kids-watching-a-movie-1254x627.jpg")
event11.image.attach(io: image_event11, filename: "event11.jpg")
event11.image.analyze
event11.image.metadata["public_id"] = Cloudinary::Uploader.upload(event11.image.blob.url, resource_type: :auto)["public_id"]
event11.save

event12 = felix.events.create!(
  name: 'Kids Robotics Workshop',
  description: 'Join our robotics workshop and learn how to build and program robots! Our experienced instructors will teach kids the basics of robotics, including coding and electronics. Kids will have fun and learn valuable skills for the future!',
  address: 'Richard-Sorge-Straße 5, 10249 Berlin, Germany',
  cost: 35.00,
  category: 'Science & Technology',
  date: '2023-07-15',
  user_id: User.all.sample.id
)
p event12
image_event12 = URI.open("https://cdn.mos.cms.futurecdn.net/ZvstZL8v7zB2BJCW8mZfBi-1200-80.jpg")
event12.image.attach(io: image_event12, filename: "event12.jpg")
event12.image.analyze
event12.image.metadata["public_id"] = Cloudinary::Uploader.upload(event12.image.blob.url, resource_type: :auto)["public_id"]
event12.save

event13 = felix.events.create!(
  name: 'Kids Nature Walk',
  description: 'Join us for a guided nature walk for kids! We will explore the local park, observe plants and animals, and learn about the environment. Our experienced guide will teach kids about conservation and environmental stewardship while having fun in nature!',
  address: 'Prenzlauer Allee 232, 10405 Berlin, Germany',
  cost: 5.00,
  category: 'Outdoors & Recreation',
  date: '2023-08-07',
  user_id: User.all.sample.id
)
p event13
image_event13 = URI.open("https://homeschoolingtorah.com/wp-content/uploads/4-18-1536x864.png")
event13.image.attach(io: image_event13, filename: "event13.jpg")
event13.image.analyze
event13.image.metadata["public_id"] = Cloudinary::Uploader.upload(event13.image.blob.url, resource_type: :auto)["public_id"]
event13.save

event14 = felix.events.create!(
  name: 'Kids Creative Writing Workshop',
  description: 'Join our creative writing workshop for kids and let their imaginations run wild! Our experienced writing instructors will teach kids the basics of storytelling and creative writing, and guide them in crafting their own short stories. Kids will learn how to express their ideas and emotions through words and have fun in the process!',
  address: 'Karl-Liebknecht-Str. 29, 10178 Berlin, Germany',
  cost: 20.00,
  category: 'Arts & Culture',
  date: '2023-08-21',
  user_id: User.all.sample.id
)
p event14
image_event14 = URI.open("https://kidcourses.com/wp-content/uploads/2015/12/creative-writing-games-for-kids.jpg")
event14.image.attach(io: image_event14, filename: "event14.jpg")
event14.image.analyze
event14.image.metadata["public_id"] = Cloudinary::Uploader.upload(event14.image.blob.url, resource_type: :auto)["public_id"]
event14.save

event15 = felix.events.create!(
  name: 'Kids Photography Workshop',
  description: 'Bring your little photographers to our photography workshop! Our professional photographer will teach kids the basics of photography and how to use a camera to take great pictures. They will learn about composition, lighting, and editing while having fun taking pictures in a scenic location!',
  address: 'Oranienburger Str. 285, 13437 Berlin, Germany',
  cost: 25.00,
  category: 'Arts & Culture',
  date: '2023-09-10',
  user_id: User.all.sample.id
)
p event15
image_event15 = URI.open("https://www.ugoceiphotography.com/wp-content/uploads/2018/07/image1-HD-1024x683.jpg")
event15.image.attach(io: image_event15, filename: "event15.jpg")
event15.image.analyze
event15.image.metadata["public_id"] = Cloudinary::Uploader.upload(event15.image.blob.url, resource_type: :auto)["public_id"]
event15.save

event16 = felix.events.create!(
  name: 'Kids Dance Class',
  description: 'Let your kids dance and have fun in our dance class! Our experienced dance instructors will teach kids different styles of dance, from hip hop to ballet. They will learn new moves, improve their coordination and flexibility, and have a great time dancing with other kids!',
  address: 'Kastanienallee 77, 10435 Berlin, Germany',
  cost: 15.00,
  category: 'Arts & Culture',
  date: '2023-09-24',
  user_id: User.all.sample.id
)
p event16
image_event16 = URI.open("https://img.freepik.com/free-photo/kids-dance-school-ballet-hiphop-street-funky-modern-dancers_155003-9448.jpg?w=2000")
event16.image.attach(io: image_event16, filename: "event16.jpg")
event16.image.analyze
event16.image.metadata["public_id"] = Cloudinary::Uploader.upload(event16.image.blob.url, resource_type: :auto)["public_id"]
event16.save

event17 = felix.events.create!(
  name: 'Kids Coding Workshop',
  description: 'Get your little ones interested in coding with our coding workshop! Our experienced instructors will teach kids the basics of coding using fun and interactive games and activities. They will learn how to write code, create games, and use different programming languages in a supportive and encouraging environment.',
  address: 'Gleimstraße 1, 10437 Berlin, Germany',
  cost: 20.00,
  category: 'Technology',
  date: '2023-10-08',
  user_id: User.all.sample.id
)
p event17
image_event17 = URI.open("https://cf.ltkcdn.net/kids/images/orig/236795-2121x1414-kid-coding.jpg")
event17.image.attach(io: image_event17, filename: "event17.jpg")
event17.image.analyze
event17.image.metadata["public_id"] = Cloudinary::Uploader.upload(event17.image.blob.url, resource_type: :auto)["public_id"]
event17.save

event18 = felix.events.create!(
  name: 'Kids Fitness Class',
  description: 'Get your kids moving with our fitness class! Our experienced fitness instructors will teach kids how to exercise safely and effectively, while having fun and making new friends. They will learn different types of exercise, such as cardio and strength training, and improve their overall fitness and health.',
  address: 'Wolliner Str. 25, 10435 Berlin, Germany',
  cost: 10.00,
  category: 'Sports & Fitness',
  date: '2023-10-22',
  user_id: User.all.sample.id
)
p event18
image_event18 = URI.open("https://blog.1life.co.uk/hubfs/Fitness%20Class%20Ideas%20For%20You%20and%20Your%20Kids.jpg")
event18.image.attach(io: image_event18, filename: "event18.jpg")
event18.image.analyze
event18.image.metadata["public_id"] = Cloudinary::Uploader.upload(event18.image.blob.url, resource_type: :auto)["public_id"]
event18.save

event19 = felix.events.create!(
  name: 'Kids Theater Workshop',
  description: 'Does your child love acting and performing? Sign them up for our theater workshop! Our experienced theater instructors will teach kids the basics of acting, voice projection, stage presence, and more. They will work on a short play throughout the workshop and perform it at the end for family and friends.',
  address: 'Warschauer Pl. 18, 10245 Berlin, Germany',
  cost: 25.00,
  category: 'Arts & Culture',
  date: '2023-11-05',
  user_id: User.all.sample.id
)
p event19
image_event19 = URI.open("https://american-rep-assets.s3.amazonaws.com/wp-content/uploads/2018/04/27031041/0602_170513_ART_Kids.jpg")
event19.image.attach(io: image_event19, filename: "event19.jpg")
event19.image.analyze
event19.image.metadata["public_id"] = Cloudinary::Uploader.upload(event19.image.blob.url, resource_type: :auto)["public_id"]
event19.save

event20 = felix.events.create!(
  name: 'Kids Stand-up Comedy Workshop',
  description: 'Let your kids unleash their inner comedian with our stand-up comedy workshop! Our professional comedians will guide kids through the process of crafting their own jokes and delivering them with confidence. Kids will also learn the art of timing, improvisation, and stage presence. At the end of the workshop, they will perform their comedy routine for family and friends. This is a great opportunity for kids to build confidence, creativity, and a sense of humor!',
  address: 'Prenzlauer Allee 48, 10405 Berlin, Germany',
  cost: 20.00,
  category: 'Arts & Entertainment',
  date: '2023-11-25',
  user_id: User.all.sample.id
)
p event20
image_event20 = URI.open("https://i.ytimg.com/vi/KsHiHsMkx5g/maxresdefault.jpg")
event20.image.attach(io: image_event20, filename: "event20.jpg")
event20.image.analyze
event20.image.metadata["public_id"] = Cloudinary::Uploader.upload(event20.image.blob.url, resource_type: :auto)["public_id"]
event20.save

event21 = felix.events.create!(
  name: 'Bubble Show for Kids',
  description: 'Get ready for a magical experience with our Bubble Show for Kids! Our expert bubble performers will create a variety of beautiful bubble shapes, from giant bubbles to bubble clouds, using a mix of science and art. Kids will be amazed and entertained by the mesmerizing colors and shapes of the bubbles, and they will even have a chance to participate in the show. This is a fun and interactive event that will spark creativity and imagination!',
  address: 'Wilmersdorfer Str. 46, 10627 Berlin, Germany',
  cost: 12.00,
  category: 'Arts & Entertainment',
  date: '2023-10-14',
  user_id: User.all.sample.id
)
p event21
image_event21 = URI.open("https://australianentertainmenttalentagency.com.au/wp-content/uploads/bubble-show.jpg")
event21.image.attach(io: image_event21, filename: "event21.jpg")
event21.image.analyze
event21.image.metadata["public_id"] = Cloudinary::Uploader.upload(event21.image.blob.url, resource_type: :auto)["public_id"]
event21.save

event22 = felix.events.create!(
  name: 'Kids Ice Skating Lesson',
  description: 'Get your kids moving and grooving with our ice skating lesson! Our experienced skating instructors will teach kids the basics of ice skating, from how to balance on the ice to gliding and stopping. They will also learn some fun skating tricks and games. Skates and helmets will be provided, so all you need to do is dress warmly and bring your sense of adventure!',
  address: 'Müllerstraße 163, 13353 Berlin, Germany',
  cost: 15.00,
  category: 'Sports',
  date: '2023-12-16',
  user_id: User.all.sample.id
)
p event22
image_event22 = URI.open("https://www.htg-architects.com/hubfs/10_16_2018%20USFS%20LEARN%20TO%20SKATE%200124.jpg")
event22.image.attach(io: image_event22, filename: "event22.jpg")
event22.image.analyze
event22.image.metadata["public_id"] = Cloudinary::Uploader.upload(event22.image.blob.url, resource_type: :auto)["public_id"]
event22.save

event23 = felix.events.create!(
  name: 'Kids Magic Show',
  description: 'Join us for a magical and enchanting experience with our Kids Magic Show! Our professional magicians will delight children of all ages with an interactive and engaging performance filled with illusions, tricks, and surprises. Your child will have the opportunity to participate in the show and even learn a few magic tricks of their own. Don\'t miss out on this unforgettable event!',
  address: 'Potsdamer Platz 1, 10785 Berlin, Germany',
  cost: 10.00,
  category: 'Arts & Entertainment',
  date: '2023-10-21',
  user_id: User.all.sample.id
)
p event23
image_event23 = URI.open("https://www.derekmagic.com/wp-content/uploads/2020/04/kids-magic-show-singapore-768x512.jpg")
event23.image.attach(io: image_event23, filename: "event23.jpg")
event23.image.analyze
event23.image.metadata["public_id"] = Cloudinary::Uploader.upload(event23.image.blob.url, resource_type: :auto)["public_id"]
event23.save

event24 = felix.events.create!(
  name: 'Kids Musical Theater Workshop',
  description: 'Does your child love to sing, dance, and act? Sign them up for our musical theater workshop! Our experienced instructors will teach kids the basics of musical theater, including singing, dancing, and acting techniques. They will also work on a short performance piece to be presented at the end of the workshop. This is a great opportunity for kids to build their confidence, creativity, and teamwork skills while also having a lot of fun!',
  address: 'Karl-Liebknecht-Str. 13, 10178 Berlin, Germany',
  cost: 25.00,
  category: 'Arts & Culture',
  date: '2024-03-02',
  user_id: User.all.sample.id
)
p event24
image_event24 = URI.open("https://appalachiacares.org/wp-content/uploads/2020/04/1588288680image.jpg")
event24.image.attach(io: image_event24, filename: "event24.jpg")
event24.image.analyze
event24.image.metadata["public_id"] = Cloudinary::Uploader.upload(event24.image.blob.url, resource_type: :auto)["public_id"]
event24.save

event25 = felix.events.create!(
  name: 'Kids Karate Class',
  description: 'Join our karate class for kids and learn discipline, self-defense, and respect in a fun and safe environment! Our experienced instructor will teach kids the basics of karate, including kicks, punches, and blocks. They will also learn about the philosophy behind karate and how it can help them in their daily lives. This is a great opportunity for kids to build their physical and mental strength while also having a lot of fun!',
  address: 'Grünberger Str. 69, 10245 Berlin, Germany',
  cost: 20.00,
  category: 'Sports & Fitness',
  date: '2024-04-06',
  user_id: User.all.sample.id
)
p event25
image_event25 = URI.open("https://shobukan.com.au/wp-content/uploads/2020/07/Practice.jpg")
event25.image.attach(io: image_event25, filename: "event25.jpg")
event25.image.analyze
event25.image.metadata["public_id"] = Cloudinary::Uploader.upload(event25.image.blob.url, resource_type: :auto)["public_id"]
event25.save

event26 = felix.events.create!(
  name: 'Puppet Making Workshop for Kids',
  description: 'Let your child\'s creativity soar with our Puppet Making Workshop for Kids! Our experienced art instructors will guide children through the process of making their own unique puppets from scratch, using a variety of materials and techniques. Kids will learn basic sewing skills, design their puppet characters, and even perform with them on a mini stage. All materials will be provided, so just bring your imagination!',
  address: 'Chausseestraße 131, 10115 Berlin, Germany',
  cost: 12.50,
  category: 'Arts & Entertainment',
  date: '2023-11-11',
  user_id: User.all.sample.id
)
p event26
image_event26 = URI.open("https://media.gettyimages.com/id/1023764030/photo/children-playing-with-puppets-in-classroom.jpg?s=1024x1024&w=gi&k=20&c=cFnRbw6WYPpJgRBHOfaqT0aSxyKBydqnbweVSD1NEoo=")
event26.image.attach(io: image_event26, filename: "event26.jpg")
event26.image.analyze
event26.image.metadata["public_id"] = Cloudinary::Uploader.upload(event26.image.blob.url, resource_type: :auto)["public_id"]
event26.save

event27 = felix.events.create!(
  name: 'Kids Music Class',
  description: 'Do you want your kids to learn music and develop their creativity? Sign them up for our music class! Our experienced instructors will teach kids the basics of music, including rhythm, melody, and harmony. They will also learn to play different instruments such as piano, guitar, and drums. This is a great opportunity for kids to explore their musical interests and develop their skills in a fun and supportive environment!',
  address: 'Rathausstraße 5, 10178 Berlin, Germany',
  cost: 25.00,
  category: 'Arts & Culture',
  date: '2024-06-01',
  user_id: User.all.sample.id
)
p event27
image_event27 = URI.open("https://www.musictogether-pdx.com/photos/2/28/DMN_2816/image_vault/190619025742259_1.jpg")
event27.image.attach(io: image_event27, filename: "event27.jpg")
event27.image.analyze
event27.image.metadata["public_id"] = Cloudinary::Uploader.upload(event27.image.blob.url, resource_type: :auto)["public_id"]
event27.save

event28 = felix.events.create!(
  name: 'Kids Lego Building Workshop',
  description: 'Join us for a fun and engaging Lego building workshop for kids! Our experienced instructors will provide a variety of Lego sets and guide children through building and designing their own unique creations. Kids will learn about problem-solving, spatial reasoning, and team-building while having a blast. All Lego sets and materials will be provided, so just bring your imagination and get ready to build!',
  address: 'Rosenthaler Straße 69, 10119 Berlin, Germany',
  cost: 10.00,
  category: 'Arts & Entertainment',
  date: '2023-10-21',
  user_id: User.all.sample.id
)
p event28
image_event28 = URI.open("https://cdn.shopify.com/s/files/1/2296/0041/articles/Lego_Theraphy_Featured.jpg?v=1579654604")
event28.image.attach(io: image_event28, filename: "event28.jpg")
event28.image.analyze
event28.image.metadata["public_id"] = Cloudinary::Uploader.upload(event28.image.blob.url, resource_type: :auto)["public_id"]
event28.save

event29 = felix.events.create!(
  name: 'Circus Skills Workshop for Kids',
  description: 'Step right up and learn some amazing circus skills at our workshop for kids! Our experienced instructors will teach children the basics of juggling, plate spinning, hula hooping, and more. Kids will learn coordination, balance, and focus while having a great time. All materials will be provided, so just bring your enthusiasm and get ready to put on a show!',
  address: 'Prenzlauer Allee 242, 10405 Berlin, Germany',
  cost: 20.00,
  category: 'Arts & Entertainment',
  date: '2023-11-18',
  user_id: User.all.sample.id
)
p event29
image_event29 = URI.open("https://www.shropshirestar.com/resizer/laO9apwIAqh6FPc8VYtYQQAWpHs=/1200x0/cloudfront-us-east-1.images.arcpublishing.com/mna/BIOI4OZ4IVDKRPFTOLWQKOS7HA.jpg")
event29.image.attach(io: image_event29, filename: "event29.jpg")
event29.image.analyze
event29.image.metadata["public_id"] = Cloudinary::Uploader.upload(event29.image.blob.url, resource_type: :auto)["public_id"]
event29.save

event30 = felix.events.create!(
  name: 'Storytelling Session for Kids',
  description: 'Join us for a magical storytelling session for kids! Our skilled storyteller will take children on an adventure with their words and imagination. Kids will learn to appreciate the art of storytelling while enjoying a captivating tale. After the session, there will be a fun art activity related to the story. Don’t miss out on this chance to bring stories to life!',
  address: 'Linienstraße 160, 10115 Berlin, Germany',
  cost: 10.00,
  category: 'Arts & Entertainment',
  date: '2023-10-14',
  user_id: User.all.sample.id
)
p event30
image_event30 = URI.open("https://www.edencastleschool.com/wp-content/uploads/2017/09/Storytelling-Sessions-for-Children-Eden-Castle-Preschool-Paschim-Vihar.jpg")
event30.image.attach(io: image_event30, filename: "event30.jpg")
event30.image.analyze
event30.image.metadata["public_id"] = Cloudinary::Uploader.upload(event30.image.blob.url, resource_type: :auto)["public_id"]
event30.save

puts "Events successfully created"
