# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
genres = ["action", "horreur", "comédie", "drame"]
Movie.destroy_all
100.times do
    movie = Movie.create!(name: Faker::Movie.title, year:  Faker::Number.between(from: 1950, to: 2020), synopsis: Faker::Quote.yoda, allocine_rating: rand(1.0 .. 5.0).round(1), director: Faker::Name.name, already_seen: Faker::Boolean.boolean)
    if movie.already_seen == true
        movie.my_rating = rand(1..5)
    else  
        movie.my_rating = nil
    end
    movie.update(genre: genres.sample)
end
puts "100 movies added"