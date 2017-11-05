# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'ffaker'

#Seeding database will remove all information for a fresh start
Genre.destroy_all
City.destroy_all
MovieTheatre.destroy_all
Showtime.destroy_all
Movie.destroy_all

#Genre
genre_api = RestClient.get("https://api.themoviedb.org/3/genre/movie/list?api_key=feb6b26953a3705ebdcb09dd99be32de&language=en-US")
genre_data = JSON.parse(genre_api)
genre_data["genres"].each do |genre|
  foo = Genre.new
  foo.id = genre["id"]
  foo.name = genre["name"]
  foo.save
end

#Movies
def create_movie(movie)
  foo = Movie.new
  foo.title = movie["title"]
  foo.genre_id = movie["genre_ids"]
  foo.id = movie["id"]
  if movie["backdrop_path"] == nil
    foo.poster = "https://image.tmdb.org/t/p/original#{movie["poster_path"]}"
    foo.smaller_poster = "https://image.tmdb.org/t/p/w640#{movie["poster_path"]}"
  else
    foo.poster = "https://image.tmdb.org/t/p/original#{movie["backdrop_path"]}"
    foo.smaller_poster = "https://image.tmdb.org/t/p/original#{movie["poster_path"]}"
  end
  foo.overview = movie["overview"]
  foo.release_date = movie["release_date"]
  foo.rating = movie["vote_average"]
  foo.save
end

movie_api_one = RestClient.get("https://api.themoviedb.org/3/movie/now_playing?api_key=feb6b26953a3705ebdcb09dd99be32de&language=en-US&page=1")
movie_api_two = RestClient.get("https://api.themoviedb.org/3/movie/now_playing?api_key=feb6b26953a3705ebdcb09dd99be32de&language=en-US&page=2")
movie_collection_one =  JSON.parse(movie_api_one)
movie_collection_two = JSON.parse(movie_api_two)

#results is the key for the movie hash
movie_collection_one["results"].each do |movie|
  create_movie(movie)
end

movie_collection_two["results"].each do |movie|
  create_movie(movie)
end

#Cities
10.times do
  #create 10 cities with manmade, city category from alphacoders && Ffaker information
  api = RestClient.get("https://wall.alphacoders.com/api2.0/get.php?auth=e624a59c6b8c30c4d361a70a7efc06db&method=sub_category&id=160335")
  data = JSON.parse(api)
  images = data["wallpapers"].sample
  City.create(name: FFaker::Address.city, full_image: images["url_image"], thumbnail: images["url_thumb"])
end

#Theatres
25.times do
  theatre_option = %w(Theatre Cinemas)
  api = RestClient.get("https://wall.alphacoders.com/api2.0/get.php?auth=e624a59c6b8c30c4d361a70a7efc06db&method=sub_category&id=160328page=2")
  data = JSON.parse(api)
  images = data["wallpapers"].sample
  MovieTheatre.create(name: FFaker::Company.name + " " + theatre_option.sample, city_id: City.all.sample.id, full_image: images["url_image"], thumbnail: images["url_thumb"])
end

#Showtimes
2000.times do
  hour = rand(1..24)
  minutes = %w[00 15 30 45].sample
  start_time = "#{hour}:#{minutes}"
  movie = Movie.all.sample
  #set the show date within three months of the movies release date
  movie_release = Date.parse(movie.release_date)
  show_date = movie_release += rand(10...90)
  Showtime.create(start_time: start_time, movie_id: Movie.all.sample.id, movie_theatre_id: MovieTheatre.all.sample.id, show_date: show_date, tickets_left: rand(0...10) )
end

#Create Demo User
user = User.new
user.first_name = "Steve"
user.last_name = "Taylor"
user.email = "steve.taylor@gmail.com"
user.username = "steve.taylor"
user.password = "helloworld!"
user.save
