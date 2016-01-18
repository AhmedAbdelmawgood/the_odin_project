def ftoc number 
	result = ((number - 32) * 5/9).to_f  
	result 
end
def ctof number 
	number = number.to_f  
	result =((number * 9/5)+32)	
	result
end
