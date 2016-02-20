def bubble_sort(x)
	i = 0 
	while i < x.length 
		break if x[i+1].nil?
		if (x[i] <= x[i+1]) 
			i+=1
			next
		else
			x[i],x[i+1] = x[i+1],x[i]
			i = 0
		end
	end
	x
end
def bubble_sort_by(x)
	type = :descending if (yield(5,6)==-1)
	arr_length = x.length
	end_detector = false
	until end_detector
		end_detector = true 
		for counter in 1...arr_length
			first = x[counter-1] 
			second = x[counter]
			h = yield(first,second) 
			case h 
				when -1 
					x[counter-1],x[counter] = x[counter],x[counter-1]
					end_detector = false 
				else 
					next 
			end
		end	
	end
		x
end
y = [5,2,6,8,2,1,3]
puts bubble_sort(y).inspect
result = bubble_sort_by(y) do |first,second|
		if first > second  
			-1
		elsif first == second
			0
		else
			1
		end  
	end
puts result.inspect