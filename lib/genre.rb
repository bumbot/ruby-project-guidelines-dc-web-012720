class Genre < ActiveRecord::Base
    has_many :shows, through: :showgenre
end