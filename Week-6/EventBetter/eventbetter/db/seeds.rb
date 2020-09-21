require 'open-uri'

User.destroy_all
puts "All users destroyed"
Event.destroy_all
puts "All events destroyed"
Attendance.destroy_all
puts "All attendances destroyed"

i = 0
3.times do
  i+=1
  user = User.new(first_name: Faker::Name.first_name, password: "azerty")
  user.email = "#{user.first_name.downcase}@yopmail.com"
  user.save
  puts "User : #{user.first_name} created."
end

i = 0
5.times do
  i+=1
  event =  Event.create!(
    start_date: Faker::Date.in_date_period(year: 2021, month: 5),
    duration: rand(1..10)*5,
    title: Faker::Book.title,
    description: Faker::Hipster.sentences,
    price: rand(1..1000),
    location: Faker::Address.city,
    host: User.all.sample
  )
  Attendance.create(user: event.host, event: event)
  puts "Event : #{event.title} créé - Event #{i}"
end

# att = Attendance.create!(host: User.first, event: Event.last)
# rand(1..3).times do
#   att.users <<  User.all.sample
#   puts att
# end
