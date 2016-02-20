require_relative 'game.rb'
puts "player 1 name::"
player1 = gets.chomp
puts "player 2 name::"
player2 = gets.chomp
ahmed = Player.new(player1)
mohammed = Player.new(player2)
Game.new(ahmed, mohammed).setup_the_game
