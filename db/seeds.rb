require "rest-client"
require "json"
require 'pry'

girls = 'http://api.tvmaze.com/search/shows?q=girls'

response_string = RestClient.get(girls)
response_hash = JSON.parse(response_string)

User.destroy_all
Show.destroy_all

ann = User.find_or_create_by(fullname: "Ann", username: "annie", password:"hey", country:"USA", status: true)


response_hash.map do |shows|
    show = shows["show"]
    if show["summary"] != nil && show["rating"]["average"] != nil && show["genres"].length > 0 && show["network"] != nil && show["network"]["name"] != nil && show["runtime"] != nil
        #binding.pry
        Show.find_or_create_by(title: show["name"],plot: show["summary"], rating: show["rating"]["average"], genre: show["genres"][0], network: show["network"]["name"], runtime: show["runtime"])
    end
end

#Pry.start