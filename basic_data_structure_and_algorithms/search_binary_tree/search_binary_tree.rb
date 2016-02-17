class Node
	attr_accessor :value, :parent, :right_child, :left_child
	def initialize(value)
		@value = value
	end

end
class Tree
	attr_accessor :root
	def initialize(data)
		data = data.shuffle
		@root = Node.new(data[0])
		data.shift
		build_tree(data)
	end
	def build_tree(data)
		data.inject(self.root) do |previous, current|
			new_node = Node.new(current)
			case previous.value <=> new_node.value
			when 0  
				previous.right_child = new_node.value
				new_node.parent = previous
				new_node
			when -1 
				search_top(previous, new_node)
				new_node
			when 1 
				previous.left_child = new_node
				new_node.parent = previous
				new_node
			end
		end
	end
	def search_top(current, new_node)

		if self.root == current
			return search_bottom(current, new_node)
		end
		if current.value >= new_node.value
			return search_bottom(current, new_node)
		elsif current.value < new_node.value
			return search_top(current.parent, new_node)
		end
	end
	def search_bottom(current, new_node)
		case current.value <= new_node.value
		when true
			if current.right_child.nil?
				new_node.parent = current
				return current.right_child = new_node
			else
				search_bottom(current.right_child, new_node)
			end
		when false
			if current.left_child.nil?
				new_node.parent = current
				return current.left_child = new_node
			else
				search_bottom(current.left_child, new_node)
			end
		end
	end
end
