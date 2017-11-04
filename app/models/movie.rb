class Movie < ApplicationRecord
  validates :title, uniqueness: true
  has_many :showtimes
  has_many :movie_theatres, through: :showtimes
end
