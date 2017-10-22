class GenresController < ApplicationController

  def index
    @items = Genre.all
    render :template => 'shared/index'
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = Movie.all.where("genre_id = #{@genre.id}")
  end

end
