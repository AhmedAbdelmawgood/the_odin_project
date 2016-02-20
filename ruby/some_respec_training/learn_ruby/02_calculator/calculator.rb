def add n1 , n2 
	result = n1 + n2 
	result

end
def subtract n1 , n2 
	result = n1 - n2 
	result 
end
def sum n 
	n = n.to_a
	$k = 0 
	n.each do |x|
		$k = $k + x 
	end
	$k

end

def multy(*a)
	i = 0
	result = 1
	it = a.length 
	while i < it do 
	result = result * (a[i])
	i = i + 1 
	end
	result
end
def power n1 , n2 
	i = 0 
	result = 1 
	while i < n2 do 
		result = result * n1
		i = i + 1
	end
	result 
end
def fact n1 
	result = 0
	if n1 == 0 
		result = 1
	
	else
	while n1 != 0 do 
		result = result + n1 
		n1 = n1 - 1 
	end
	end
	result
end 