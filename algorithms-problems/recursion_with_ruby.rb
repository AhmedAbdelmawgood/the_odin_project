#flatter method
def flatter_array(ary, result = [])
  grab = ary.pop
  if grab.class == Array
    flatter_array(grab, result)
    else
      result.unshift(grab)
    end
  if ary.length == 0
    return result
    else
      flatter_array(ary, result)
    end
end
#fibonatche sequence
def fib(n)
	if n <= 0 
		return 0
	elsif n == 1
		return 1
	elsif n == 2
		fib(1) + fib(0)
	end
	fib(n-1) + fib(n - 2)
end

