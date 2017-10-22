class MovieTheatre < ApplicationRecord
  belongs_to :city
  has_many :showtimes
  has_many :movies, through: :showtimes
end
