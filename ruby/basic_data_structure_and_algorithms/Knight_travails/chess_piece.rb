class Node
	attr_accessor :parent,:value, :childs
	def initialize(value)
		@value = value
		@childs = []
	end
end
class Tree
	attr_accessor :root, :data
	def initialize(root)
		@root = Node.new(root)
	end
	def add_childs(node, data)
		data.each do |value|
			new_node = Node.new(value)
			node.childs << new_node
			new_node.parent = node
		end
	end
end
class Piece
	attr_accessor :symbol, :position
	def initialize(cor, symbol = "♘")
		@position = cor
		@symbol = symbol
	end
	def moves(position)
		row = position[0]
		column = position[1]
		[ 
		[row-2, column+1], 
		[row-2, column-1],
		[row-1, column+2],
		[row-1, column-2],
		[row+2, column+1], 
		[row+2, column-1],
		[row+1, column+2],
		[row+1, column-2] 
		] 
	end
	def print_shortest_path(target_path)
		moves = shortest_path(target_path)
		moves.each {|move| p move}
		return nil
	end
	def shortest_path(target_path, moves = [])
		target = search_paths(target_path)
		moves.unshift(target.value)
		while target.parent
			target = target.parent
			moves.unshift(target.value)
		end
		moves
	end
	def search_paths(value)
		tree = create_tree
		queue = [tree.root]
		until queue.empty?
		current_node = queue.shift
		return current_node if (current_node.value == value)
		moves_list = possible_moves(current_node.value)
		append_childs(tree, current_node, moves_list) #refactor this line
		current_node.childs.each {|child| queue << child}
		end
	end
	def append_childs(tree, current_node, moves_list)
		tree.add_childs(current_node, moves_list)
	end
	def create_tree
		Tree.new(position)
	end
	def possible_moves(position)
		moves(position).select {|coordinate| coordinate.all?{|x| (0..7).include? x}}
	end
end
