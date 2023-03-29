# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Deleting Users..."

User.destroy_all

puts "Deleting Chatrooms..."

Chatroom.destroy_all

puts "Deleting Messages..."

Message.destroy_all

puts "Creating Users..."

users = []

john = User.create(email: 'john@example.com',
  password: '123456',
  first_name: 'John',
  last_name: 'Doe',
  address: 'Berliner Alle 125')

p john
users << john

felix = User.create(email: 'felix@example.com',
  password: '123456',
  first_name: 'Felix',
  last_name: 'Baumgartner',
  address: 'Rosa Luxemburg Str. 84')

p felix
users << felix

jane = User.create(email: 'jane@example.com',
  password: '123456',
  first_name: 'Jane',
  last_name: 'Jackson',
  address: 'Simon Bolivar Str. 52')

p jane
users << jane

norma = User.create(email: 'norma@example.com',
  password: '123456',
  first_name: 'Norma',
  last_name: 'Baker',
  address: 'Sonnenalle 785')

p norma
users << norma

rodrigo = User.create(email: 'rodrigo@example.com',
  password: '123456',
  first_name: 'Rodrigo',
  last_name: 'Mueller',
  address: 'Schönhauser Alle 77')

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
