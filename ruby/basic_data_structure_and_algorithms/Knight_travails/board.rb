require './chess_piece'
require  'terminal-table'
class Cell
	attr_accessor :symbol
	def initialize
		@symbol = " "
	end
end
class Board
	attr_accessor :pieces, :board_ary
	def initialize
		@pieces = create_pieces
		prepare_board
	end
	def move_piece(coordinate, new_coordinate)
		the_piece = pieces.select {|piece| piece.position == coordinate}
		unless the_piece.empty?
			p the_piece
		the_piece = the_piece[0] 
		the_piece.position = new_coordinate
		prepare_board
		end
	end
	def prepare_board
		ary = []
		8.times {ary << Array.new(8) {Cell.new}}
		position_the_pieces(ary)
		@board_ary = ary 
		print_board				
	end
	def position_the_pieces(ary)
		p pieces
		pieces.each do |piece|
			x,y = piece_position(piece)
			ary[x][y] = piece 
		end
	end
	def piece_position(piece)
		piece.position
	end
	def create_pieces
		ary = []
		ary << Piece.new([4,4])
		ary
	end
	def print_board
		table = Terminal::Table.new do |t|
			terminat = 0
			board_ary.each do |row|
			terminat +=1 
				t.add_row to_the_symbol(row)
				t.add_separator unless terminat == 8
			end
		end
	puts table
	end

	def to_the_symbol(ary)
		ary.map! {|cell| cell.symbol}
	end
end
