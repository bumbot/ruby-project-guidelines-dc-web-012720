require "rest-client"
require "json"
require 'pry'
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

User.destroy_all
Show.destroy_all
Watchlist.destroy_all
Genre.destroy_all
ShowGenre.destroy_all
Network.destroy_all

ann = User.find_or_create_by(fullname: "Ann", username: "annie", password:"hey", country:"USA", status: true)

def find_show(string="girls")
    search_term = string.gsub(" ", "+")
    url = "http://api.tvmaze.com/search/shows?q=#{search_term}"

    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)

    response_hash.map do |shows|
        show = shows["show"]
        
        if show["rating"]["average"] != nil && show["genres"].length > 0 && show["network"] != nil && show["network"]["name"] != nil && show["runtime"] != nil
            tv_show = Show.find_or_create_by(title: show["name"].downcase, plot: show["summary"], rating: show["rating"]["average"], genre: show["genres"][0].downcase, network: Network.find_or_create_by(name: show["network"]["name"].downcase), runtime: show["runtime"])
            
            tv_genre = Genre.find_or_create_by(genre: tv_show.genre)
            ShowGenre.create(show_id: tv_show.id, genre_id: tv_genre.id)

            tv_show
        end
    end
end

# shows = find_show

# watch1 = Watchlist.find_or_create_by(user_id: ann.id, show_id: shows[0].id)
# watch2 = Watchlist.find_or_create_by(user_id: ann.id, show_id: shows[1].id)
# watch3 = Watchlist.find_or_create_by(user_id: ann.id, show_id: shows[2].id)

#Pry.start