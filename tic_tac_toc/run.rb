require_relative 'game.rb'
ahmed = Player.new("ahmed")
mohammed = Player.new("mohammed")
Game.new(ahmed, mohammed).setup_the_game
