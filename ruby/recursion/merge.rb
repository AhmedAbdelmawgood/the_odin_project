def merge_sort(ary)
	if ary.length == 1
		return [ary[0]]
	end
	if ary.length == 2
		return (ary[0] < ary[1])? [ary[0], ary[1]] : [ary[1], ary[0]]
	end
	merge(merge_sort(ary.slice!(0, ary.length/2)), merge_sort(ary))
end

def merge(ary1, ary2, result=[])
	until (ary1.length == 0 || ary2.length == 0)
		a = ary1[0]
		b = ary2[0]
		( a < b)? result << ary1.shift : result << ary2.shift
	end
	(ary1.empty?)? result+=ary2 : result+=ary1 
	result
end