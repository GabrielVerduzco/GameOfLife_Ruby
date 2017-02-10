require_relative 'gameLife'


class Player
  attr_accessor :new_game
  def initialize
    @new_game = Board.new(10,10)
  end




end



game = Player.new

while true do
  puts "Hola"
  system "clear"
  game.new_game.god
  sleep(2)


end
