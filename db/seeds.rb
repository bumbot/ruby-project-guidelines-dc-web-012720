require "rest-client"
require "json"
require 'pry'

girls = 'http://api.tvmaze.com/search/shows?q=girls'

response_string = RestClient.get(girls)
response_hash = JSON.parse(response_string)

User.destroy_all
Show.destroy_all

ann = User.find_or_create_by(fullname: "Ann", username: "annie", password:"hey", country:"USA")


response_hash.first(10).map do |shows|
    show = shows["show"]
    if show["network"] != nil && show["rating"]["average"] != nil && show["genres"][0] != nil
        #binding.pry
        Show.find_or_create_by(title: show["name"], actors: "Amy Adams", directors: "Joe", plot: show["summary"], rating: show["rating"]["average"], genre: show["genres"][0], network: show["network"]["name"], start_date: show["premiered"], end_date: nil)
    end
end

#Pry.start