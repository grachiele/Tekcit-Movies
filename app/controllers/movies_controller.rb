class MoviesController < ApplicationController

  def index
    @items = Movie.all
    render :template => 'shared/index'
  end

  def show
    @movie = Movie.find(params[:id])
    @showtimes = Showtime.all.where("movie_id = #{@movie.id}")
  end
  
end
