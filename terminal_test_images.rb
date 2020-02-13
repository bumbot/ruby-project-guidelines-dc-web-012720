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
    :limit_x => 1,
    :limit_y => 0.8,
    :center_x => true,
    :center_y => true,
    :bg => "black",
    :bg_fill => false,
    :resolution => "high"
end

def create_quote
  Faker::Quote.unique.famous_last_words
end

def food_description
  Faker::Food.unique.description
end

def movie_quote
  [Faker::Movies::StarWars.unique.quote,
  Faker::Movies::StarWars.unique.quote,
  Faker::Movies::StarWars.unique.wookiee_sentence,
  Faker::Movies::StarWars.unique.wookiee_sentence,
  Faker::Movies::BackToTheFuture.unique.quote,
  Faker::Movies::BackToTheFuture.unique.quote,
  Faker::Movies::HarryPotter.unique.quote,
  Faker::Movies::HarryPotter.unique.quote,
  Faker::Movies::Hobbit.unique.quote,
  Faker::Movies::Hobbit.unique.quote,
  Faker::Movies::LordOfTheRings.unique.quote,
  Faker::Movies::LordOfTheRings.unique.quote,
  Faker::Movies::PrincessBride.unique.quote,
  Faker::Movies::PrincessBride.unique.quote].sample
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
def watch_movie
  path = sample
  puts ""
  print_image(path)
  puts random_description
  sleep 3

  path = sample
  puts ""
  print_image(path)
  puts random_description
  sleep 5

  path = sample
  puts ""
  print_image(path)
  puts random_description
  puts ""
end