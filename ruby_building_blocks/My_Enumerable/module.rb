module Enumerable
	def my_each
		array = self
		array_length = array.length 
		for num in 0...array_length
			element = array[num] 
			yield(element) 
		end
		self
	end
	def my_each_with_index 
		array = self
		array_length = array.length 
		for num in 0...array_length
			element = array[num] 
			yield(element,num) 
		end
		self
	end
	def my_select
		array = self 
		array_length = array.length 
		returned = []
		array_length.times do |x|
			element = array[x]
			returned << element if yield(element)
		end
		returned 
	end
	def my_all?
		self.length.times do |x|
			return false unless yield(self[x])
		end
		true 
	end
	def my_any?
		self.length.times do |x|
			return true if yield(self[x])
		end
		false 
	end
	def my_none?
		self.length.times do |x|
			return false if yield(self[x])
		end
		true 
	end
	def my_count (arg = nil)
		count=0
		n=0
		until self[n].nil? 
			count+=1 if arg == self[n] || arg == nil
			n+=1
		end 
		return count
	end
	def my_map(the_proc=nil)
		returned = []
		self.length.times do |x|
			(returned << yield(self[x])) if block_given?
			returned << the_proc.call(self[x]) if the_proc && !(block_given?)	
		end
		returned
	end
	def my_inject(value=0)
		self.length.times do |x|
			value = yield(value,self[x])
		end
		value
	end

end
 					#test some of the method 
def multiply_els(arr)
	return(arr.my_inject(1) {|retu,arr_val| retu*arr_val})
end
a_proc = Proc.new do |x| 
		x*2 
	end
puts [1,5,8,9].my_map(a_proc) 