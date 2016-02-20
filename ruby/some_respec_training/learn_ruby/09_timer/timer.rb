class Timer 
	attr_accessor :seconds
	def initialize 
		@seconds = 0.00
		@int_sec = 0.00
		@int_min = 0.00
		@int_hou = 0.00
	end 
	def time_string 
		@int_hou = @seconds / 3600.0
		@int_min = (@int_hou-@int_hou.to_i) *60.0  
		@int_sec = (@int_min-@int_min.to_i) *60.0
		result = [@int_hou , @int_min , @int_sec]
		result.map! {|x| x.to_i}
		result.map! {|x| (x.to_s)}
		result.map! {|x| (x.length == 1 ? "0" + x : x)}
		result.join(":")
	end

end
ahmed = Timer.new 
ahmed.seconds = 0
puts ahmed.time_string
=begin
class Restaurant
 attr_accessor :name, :type, :avg_price
 def initialize(name, type, price)
   @name = name
   @type = type
   @avg_price = price
 end
 end
chipotle = Restaurant.new 'Chipotle', 'Mexican', 8.00
puts chipotle.type 
=end