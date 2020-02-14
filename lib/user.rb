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
        watchlist.map{|show| Show.find_by(id: show.show_id).title}
    end

    def self.login(usernames, password)
        if User.find_by(username: usernames)
            user = User.find_by(username: usernames)
            if password == user.password
                puts "\nLogin Successful"
                return user
            else 
                puts "\nIncorrect Password"
            end
        end
    end

    def self.create_account(fullname, username, password, country)
        if User.find_by(username: username)
            puts "\nThis account already exists!"
        else
            User.create(fullname: fullname, username: username, password: password, country: country, status: true)
        end
    end

    def deactivate_account
        self.update(status: false)
    end

    def activate_account
        self.update(status: true)
    end

    def add_show(show_name)
        show = Show.where(title: show_name)
        Watchlist.create(user_id: self.id, show_id: show[0].id)
    end

    def remove_show(show_name)
        show = Show.where(title: show_name)
        watchlist = Watchlist.find_by(user_id: self.id, show_id: show[0].id)
        Watchlist.delete(watchlist.id)
    end

    def total_runtime
        watchlist = Watchlist.where(user_id: self.id)
        all_shows = watchlist.map{|show| Show.find(show.show_id)}
        all_shows.sum{|show| show.runtime}
    end
end