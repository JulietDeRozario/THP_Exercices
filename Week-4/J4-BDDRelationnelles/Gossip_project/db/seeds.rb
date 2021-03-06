User.destroy_all
Gossip.destroy_all
Tag.destroy_all
City.destroy_all
PrivateMessage.destroy_all
JoinTableGossipTag.destroy_all

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

#Create 10 users
10.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::VForVendetta.quote, age: rand(16..77), city: City.all.sample)

  user.update(email:"#{user.first_name.downcase}.#{user.last_name.downcase}@protonmail.com")
end

#Create 20 gossips
20.times do
  gossip = Gossip.create(title: Faker::Hipster.word, content: Faker::ChuckNorris.fact, user: User.all.sample)
end

#Create 10 tags
10.times do
tag = Tag.create(title: Faker::Hacker.ingverb)
end
#Assignate tags to gossips
Tag.all.each do |tag|
  rand(1..4).times do
    tag.gossips << Gossip.all.sample
  end
end

#Create 20 messages
20.times do
  pm = PrivateMessage.create(content: Faker::Hacker.say_something_smart, sender: User.all.sample, recipient: User.all.sample)
end
