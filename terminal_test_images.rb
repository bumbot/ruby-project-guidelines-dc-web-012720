require 'catpix'
require 'faker'

def print_image(string="pikachu.png")
  Catpix::print_image "./pics/#{string}",
    :limit_x => 1,
    :limit_y => 1,
    :center_x => true,
    :center_y => true,
    :bg => "black",
    :bg_fill => false,
    :resolution => "high"
end

puts ""
print_image
puts Faker::Quote.unique.famous_last_words
sleep 3
puts ""
print_image("sushi.png")
puts Faker::Food.unique.description
sleep 5
puts ""
print_image("pikachu.gif")
puts Faker::Quote.unique.famous_last_words
