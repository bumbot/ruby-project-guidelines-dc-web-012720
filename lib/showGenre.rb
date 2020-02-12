class ShowGenre < ActiveRecord::Base
    has_many :shows
    has_many :genres
end