require "pry"

class User < ActiveRecord::Base
    has_many :shows, through: :watchlist

    def favorite_network
        networks = {}
        self.queue.each{|show| 
            if networks.include?(show.network)
                networks[show.network] += 1
            else
                networks[show.network] = 1
            end
        }
        networks.max_by{|k, v| v}


    end

    def queue
        watchlist = Watchlist.where(user_id: self.id) 
        p watchlist.map{|show| Show.find_by(id: show.show_id)}
    end

    def self.login(usernames, password)
        if User.find_by(username: usernames)
            user = User.find_by(username: usernames)
            if password == user.password
                puts "Login Successful"
                return user
            else 
                puts "Incorrect Password"
            end
        end
    end

    def self.create_account(fullname, username, password, country)
        User.create(fullname: fullname, username: username, password: password, country: country, status: true)
    end

    def deactivate_account
        self.update(status: false)
    end

    def activate_account
        self.update(status: true)
    end
    
end