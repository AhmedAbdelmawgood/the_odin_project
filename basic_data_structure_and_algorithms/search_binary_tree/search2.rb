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
		data.each {|value| dig_bottom(root, Node.new(value))}
	end
	def dig_bottom(current, new_node)
		if current.value <= new_node.value
			(current.right_child.nil?) ? (return current.right_child = new_node) : dig_bottom(current.right_child, new_node)
		elsif current.value > new_node.value
			(current.left_child.nil?) ? (return current.left_child = new_node) : dig_bottom(current.left_child, new_node)
		end	
	end
	def search(value,node = root,queue = [])
		if node.nil?
			return puts "node with this value #{value} doesn't exist"
		end
		if node.value == value
			return node
		elsif node.value < value
			queue << node
			return search(value, node.right_child, queue)
		else node.value > value
			return search(value, node.left_child, queue)
		end

	end
end
