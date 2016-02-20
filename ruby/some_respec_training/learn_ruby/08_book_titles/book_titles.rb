class Book 
	attr_accessor :title 
	def title
		forbidden = ["the" , "a" , "an" , "and" , "or" , "but" , "in" ,"on" , "at","of"]
		result  = @title.split(" ")
		result.each_with_index do |v , index|
			if !(forbidden.include?v) or index == 0
			#compare the words to the forbidden class 
			#and if match and not the first word it exlude it from capitalizaiotn
				v.capitalize!
			end
			
	end 
	result.join(" ")
end
end
bo = Book.new 

