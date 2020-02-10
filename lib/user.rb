class User < ActiveRecord::Base
    has_many :shows, through: :watchlist

    
end