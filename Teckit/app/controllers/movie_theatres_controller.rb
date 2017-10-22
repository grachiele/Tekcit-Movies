class MovieTheatresController < ApplicationController

  def index
    @items = MovieTheatre.all
    render :template => 'shared/index'
  end

  def show
    @movie_theatre = MovieTheatre.find(params[:id])
    @showtimes = Showtime.all.select { |showtime| showtime.movie_theatre_id == @movie_theatre.id }
  end

end
