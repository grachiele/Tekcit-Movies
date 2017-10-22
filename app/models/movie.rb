class Movie < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :genre
  has_many :showtimes
  has_many :movie_theatres, through: :showtimes
end
