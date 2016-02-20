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
		p data
		@root = Node.new(data[0])
		data.shift
		build_tree(data)
	end
	#iterate over the array of data and create nodes
	def build_tree(data)
		data.each {|value| dig_bottom(root, Node.new(value))}
	end
	#method to help searching for the approbriate place and assign the node to it
	def dig_bottom(current, new_node)
		if node_value(current) <= node_value(new_node)
			(current.right_child.nil?) ? (current.right_child = new_node; new_node.parent = current) : dig_bottom(current.right_child, new_node)
		elsif node_value(current) > node_value(new_node)
			(current.left_child.nil?) ? (current.left_child = new_node; new_node.parent = current) : dig_bottom(current.left_child, new_node)
		end	
	end
	#using the breadth and depth search methods on the binary tree
	def search(value,  container= [])
		container << root.left_child unless root.left_child.nil?
		container << root.right_child unless root.right_child.nil?
		puts "which type you want breadth or depth search?[breadth/depth]"
		type = gets.chomp.downcase
		until container.empty?
			(type == "breadth")? node = container.shift : node = container.pop
			if node_value(node) == value
				return node
			else
				container << node.left_child unless node.left_child.nil?
				container << node.right_child unless node.right_child.nil?
			end
		end
		return nil
	end
	def node_value(node)
		node.value if node
	end
	def dfs_rec(value, node=root)
		return nil if node.nil?
		if node_value(node) == value
			return node 
		end
		return( (dfs_rec(value, node.left_child)) || (dfs_rec(value,node.right_child)) )
	end
	def search_with_root(value,node = root) 
		if node.nil?
			return puts "node with this value #{value} doesn't exist"
		end
		if node_value(node) == value
			return node
		elsif node_value(node) < value
			return search_with_root(value, node.right_child)
		else node_value(node) > value
			return search_with_root(value, node.left_child)
		end
	end
end
