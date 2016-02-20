def echo n 
 n  
end
def shout n 
	n.upcase!
end
def repeat(n , a=2)
 k = (n + " ")*a
 r = k.split(" ").join(" ")
 
end
def start_of_word (a,r)
	n = 0
	a.byteslice(n,r)
end
def first_word k 
	k.split(" ").first 

end
def titleize a 
	i = 0
	cancel = ["and" , "the" , "over" , "a" , "an"]
	result = a.split(" ").each do |x|
		if( !(cancel.include? x) or i==0)
			
			  x.capitalize!

	end
	i = 1
	end 
	result = result.join(" ") 
	result

end
puts titleize("the ahmed and samir")