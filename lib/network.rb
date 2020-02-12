class Network < ActiveRecord::Base
    has_many :shows

    def self.all_networks
        self.all.map{|network| network.name}
    end
end