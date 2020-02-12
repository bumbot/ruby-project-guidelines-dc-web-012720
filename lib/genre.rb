class Genre < ActiveRecord::Base
    has_many :shows, through: :showgenre

    def self.all_genres
        self.all.map{|genre| genre.genre}
    end
end