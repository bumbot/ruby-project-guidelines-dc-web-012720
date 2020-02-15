require 'pry'

class Show < ActiveRecord::Base
    has_many :users, through: :watchlist
    has_many :genres, through: :showgenre
    belongs_to :network


    def self.best_show
        initialShow = self.all[0]
        r = initialShow.rating
        self.all.each{ |show|
            if show.rating > r 
                initialShow = show
                r = show.rating
            end}
        initialShow
    end

    def self.sort_by_rating(num)
        arr = self.all.select{|show| show.rating >= num}
        arr.map{|show| show.title}
    end

    def self.all_titles
        self.all.map{|show| show.title}
    end

    def self.genre(name)
        genre_name = Genre.find_by(genre: name)
        if genre_name == nil
            return []
        else
            join = ShowGenre.all.select{|obj| obj.genre_id == genre_name.id}
            
            join.map{|id| Show.find(id.show_id).title}
        end
    end

    def self.network(name)
        network = Network.find_by(name: name)
        if network == nil
            return []
        else
            shows = Show.all.select{|show| show.network_id == network.id}
            shows.map{|show| show.title}
        end
    end
    
end