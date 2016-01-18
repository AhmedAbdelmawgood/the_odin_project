def translate a 
	#create proc that do the formating for seperated word
	the_proc = Proc.new do |x|
		new_part = Array.new
		contain = ["a" , "e" , "i" , "o", "u" ] #for comparing if any of the seperated letter is vowel
			x.gsub! 'qu','cccc' 
			x.gsub! 'sch' , 'nnnn' #this is like add encoding for the combinations that are constant
		oper = x.split("") #seperate word into letters
		while( !(contain.include?oper[0])) do #as long as the letter is not a vowel we do the following
	 		#transfer the first letter to another variable and test the new letter for condition
			r = oper.delete_at(0)
			new_part.push(r)  #container for the deleted word that will be added later to the final answer
				 
		end
		result = oper.join + new_part.join #the comnination of the final asnwer
		if result[-1] == "a"  #addation of the suffix according to the rules
		result = result + "y"
		elsif result[-2..-1] == "ay"
			result
		else 
			result = result + "ay"
			
		end 
		result.gsub! 'cccc','qu'
		result.gsub! 'nnnn','sch'
		result
	end
	
	if !(a.include?" ") #for string with no spaces
		the_proc.call(a)
	else #for string with spaces. 
		oper = a.split(" ")#seperate each with the space 
		oper-[" "]#remove the spaces
		oper.each_with_index do |str,index| 
			oper[index] = the_proc.call(str) #replace each word with the new form
		end

		oper.join(" ") #return the final answer
	end
	
end

=begin
	the_proc = Proc.new do |x|
		new_part = Array.new
		contain = ["a" , "e" , "i" , "o", "u"]
		oper = x.split("")
		while !(contain.include?oper[0]) do 
	 			
					r = oper.delete_at(0)
					new_part.push(r)  
				 
		end
		l = oper + new_part
		l.join
		end
	#puts $the_proc.call("what")
	#puts $the_proc.class
=end
