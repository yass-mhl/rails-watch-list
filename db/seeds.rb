# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Movie.destroy_all
puts 'Detroy all movies.................'

url = 'http://tmdb.lewagon.com/movie/top_rated'
user = JSON.parse(URI.open(url).read)

user['results'].each do |movie|
  puts 'Start creating a movie............'
  new_movie = Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  puts "#{new_movie.title} is created"
end
puts 'Seeding Good.............................'
