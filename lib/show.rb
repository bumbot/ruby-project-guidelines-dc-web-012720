class Show < ActiveRecord::Base
    has_many :users, through: :watchlist


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
    
end