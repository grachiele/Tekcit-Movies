# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.destroy_all
City.destroy_all
MovieTheatre.destroy_all
Showtime.destroy_all


genres = %w(Comedy Horror Action Romance Drama War Animation)

genres.each do |genre|
  Genre.create(name: genre)
end

require 'ffaker'
100.times do
  api = RestClient.get("https://wall.alphacoders.com/api2.0/get.php?auth=e624a59c6b8c30c4d361a70a7efc06db&method=category&id=1&page=#{rand(1..20)}&info_level=2")
  data = JSON.parse(api)
  images = data["wallpapers"].sample
  Movie.create(name: FFaker::Movie.title, genre_id: Genre.all.sample.id, full_image: images["url_image"], thumbnail: images["url_thumb"])
end

10.times do
  api = RestClient.get("https://wall.alphacoders.com/api2.0/get.php?auth=e624a59c6b8c30c4d361a70a7efc06db&method=by_collection&id=296&page=#{rand(1..20)}&info_level=2")
  data = JSON.parse(api)
  images = data["wallpapers"].sample
  City.create(name: FFaker::Address.city, full_image: images["url_image"], thumbnail: images["url_thumb"])
end

50.times do
  theatre_option = %w(Theatre Cinemas)
  api = RestClient.get("https://wall.alphacoders.com/api2.0/get.php?auth=e624a59c6b8c30c4d361a70a7efc06db&method=sub_category&id=160328page=#{rand(1..20)}&info_level=2")
  data = JSON.parse(api)
  images = data["wallpapers"].sample
  MovieTheatre.create(name: FFaker::Company.name + " " + theatre_option.sample, city_id: City.all.sample.id, full_image: images["url_image"], thumbnail: images["url_thumb"])
end

1000.times do
  start_time = "#{rand(1..24)}:#{rand(6)}#{rand(10)}"
  show_date = "0#{rand(8..9)}/0#{rand(1..7)}/2017"
  Showtime.create(start_time: start_time, movie_id: Movie.all.sample.id, movie_theatre_id: MovieTheatre.all.sample.id, show_date: show_date )
end
