class Show < ActiveRecord::Base
    has_many :users, through: :watchlist

    
end