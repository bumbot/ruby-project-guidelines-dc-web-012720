require 'catpix'
require 'faker'
require 'pry'

FILES = Dir["./pics/*.{jpg,png,gif,jpeg}"]

def sample
  #returns a random pic pathname from pic folder
  FILES.sample
end

def print_image(path)
  Catpix::print_image "#{path}",
    :limit_x => 0.5,
    :limit_y => 2,
    :center_x => true,
    :center_y => true,
    :bg => "black",
    :bg_fill => false,
    :resolution => "high"
end

def create_quote
  Faker::Quote.famous_last_words
end

def food_description
  Faker::Food.description
end

def movie_quote
  [Faker::Movies::StarWars.quote,
  Faker::Movies::StarWars.quote,
  Faker::Movies::StarWars.wookiee_sentence,
  Faker::Movies::StarWars.wookiee_sentence,
  Faker::Movies::BackToTheFuture.quote,
  Faker::Movies::BackToTheFuture.quote,
  Faker::Movies::HarryPotter.quote,
  Faker::Movies::HarryPotter.quote,
  Faker::Movies::Hobbit.quote,
  Faker::Movies::Hobbit.quote,
  Faker::Movies::LordOfTheRings.quote,
  Faker::Movies::LordOfTheRings.quote,
  Faker::Movies::PrincessBride.quote,
  Faker::Movies::PrincessBride.quote].sample
end

def random_description
  [create_quote, create_quote, food_description, food_description, movie_quote, movie_quote].sample
end

#
#
# 
#
#
#
#

def watch_movie(int=3)
  i = 0
  while i < int
    i+=1
    path = sample
    puts ""
    print_image(path)
    puts "\t#{random_description}"
    sleep 5
  end
end