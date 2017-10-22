class CitiesController < ApplicationController

  def index
    @items = City.all
    render :template => 'shared/index'
  end

  def show
    @city = City.find(params[:id])
    @theatres = MovieTheatre.select { |theatre| theatre.city_id == @city.id }
  end

end
