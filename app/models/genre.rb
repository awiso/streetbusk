class Genre < ApplicationRecord
  has_many :performances
  has_many :artist_genres
end
