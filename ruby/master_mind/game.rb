require_relative "player"
require_relative "mechanics"
require_relative "core_extension"

class Game
  include Mechanism
  attr_reader :roler, :guesser, :system#, :computer

  def initialize(roler, guesser)
    @roler = Player.new(roler)
    @guesser = Player.new(guesser)
    @final_answer = nil
    @turns_number = 0
  end

  def self.setup
    puts "pls enter the roler name"
    roler = gets.chomp
    puts "pls enter the guesser name"
    guesser = gets.chomp
    Game.new(roler, guesser)
  end
  def run
    set_roler_colors
    puts "\e[H\e[2J"
    grid_print
    state = false
    until state
      puts "turn #{ @turns_number } #{'THE LAST TURN' if @turns_number == 11} try to guess the right colors and their position \n #{OPTIONS.join(" ")}"
      the_guess = check_format(guesser)
      state = end_detector(the_guess, @final_answer)
    end
    winner_or_loser(state)
  end
  def winner_or_loser(state)
    case state
    when :winner then puts "congratulation #{guesser.name} you guess it right"
    when :loser then puts "Sorry #{guesser.name} GAME OVER. Good luck next time"
    end
  end

  def set_roler_colors
    puts "pls #{roler.name} chose your secret 4 colors in their order and enter them \n #{OPTIONS.join(" ")}"
    @final_answer = check_format(roler)
  end

def check_format(user)
  begin
    the_choices = user.respond.downcase.split
    raise "It seemed there is an error in your input this error might be \n not exactely 4 colors. \n spelling error \n color out of the option
    pls try again \n #{OPTIONS.join(" ")}" unless verify_choices(the_choices)
  rescue => e
    puts "\e[H\e[2J"
    puts e
    retry
  end
  the_choices
end


end
