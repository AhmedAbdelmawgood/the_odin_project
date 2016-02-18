require './board.rb'
x = Piece.new([4,4])
path =  x.shortest_path([0,0])
board = Board.new
board.prepare_board
old_co = path[0]
path.each do |move|
	board.move_piece(old_co, move)
	old_co = move
	sleep 2
end 