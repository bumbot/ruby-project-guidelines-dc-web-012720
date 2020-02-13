require 'catpix'
require 'faker'

def print_movie(string="pikachu.png")
  Catpix::print_image "./pics/#{string}",
    :limit_x => 2,
    :limit_y => 2,
    :center_x => true,
    :center_y => true,
    :bg => "black",
    :bg_fill => false,
    :resolution => "auto"
end

print_movie
puts Faker::
sleep 2
print_movie("pikachu.gif")