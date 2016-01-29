require_relative 'board'
require_relative 'player'
require_relative 'mechanism'
class Game
  include Mechanism
  attr_accessor :player1, :player2, :board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @cells = {1 =>[ "", "", "" ], 2 => [ "", "", ""  ], 3 => [ "", "", "" ]}
  end
  def setup_the_game
    until check(@cells, player2.symbol)
      player_move(player1)
      if check(@cells, player1.symbol)
      announce_winner(player1.name)
      end
      player_move(player2)
    end
    announce_winner(player2.name)
  end

  #private
  def player_move(player)
    puts "#{player.name} enter one choice (TL,TM,TR;ML,MM,MR;BL,BM,BR)"
    begin
    choice = gets.chomp
    x = convert_to_coordinate(choice) #expecting [1..3, 0..2]
    raise "nonempty cell" unless (@cells[x[0]][x[1]].empty?) #validate if the cell is empty
      @cells[x[0]][x[1]] = player.symbol
      puts @cells.inspect
      board.grid(@cells)
    rescue => e
      puts e
      retry
    end
  end
  def announce_winner(player_name)
    puts "#{player_name} had won"
    exit
  end
end
