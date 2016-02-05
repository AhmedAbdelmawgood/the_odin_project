load './player.rb'
load './database_handler.rb'
load './checking_system.rb'
load './save_load.rb'
require 'yaml'
 #change to require
class Hangman
  include Mechanism
  include Save_load
  attr_reader :player, :database
  attr_accessor :final_answer

  def initialize(name)
    @player = Player.new(name)
    puts "HI #{player.name}"
    @database = The_database.setup
    initiate_data
  end

  def initiate_data
    puts "do you want to load a game"
    if gets.chomp == "yes"
      load_file
    else
      @final_answer = database.retrieve_random_word.split("")
      @turns_number = 12
      build_containers
    end
  end
  def run
    loop do
      display_grid
      puts "do you want to save file"
      if gets.chomp == "yes"
        save_file(player.name)
        exit
      end
      user_input = input_rules
      break if end_detector(user_input)
    end
    puts "the final answer is #{@final_answer.join} "
  end
  private


end
