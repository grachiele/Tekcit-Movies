class Showtime < ApplicationRecord
  belongs_to :movie_theatre
  belongs_to :movie
  has_many :tickets
end
