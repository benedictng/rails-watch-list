# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

p 'seeding movies'

10.times do
  p Movie.create({
    title: Faker::GreekPhilosophers.name,
    overview: Faker::Quote.famous_last_words,
    poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
    rating: (rand * 10).round(1)
    })
end
p 'seeding lists'
5.times do
  p List.create({
      name: Faker::Emotion.noun
    })
end

p 'seeding bookmarks'
100.times do
  p Bookmark.create({
    movie: Movie.order(Arel.sql('RANDOM()')).first,
    list: List.order(Arel.sql('RANDOM()')).first,
    comment: Faker::TvShows::RickAndMorty.quote
  })
end

p 'seeded'
