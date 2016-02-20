# first the iteration methods
def fib(n)
	final_result = 1 
	next_result = 0
  (0..n).each do |x|
  		next_result += final_result   #1, 1, 2, 3, 
  		final_result = next_result - final_result #0, 1, 1, 2   
	end
	final_result
end
#recursion method fi
def fib2(n)
	if n <= 0 
		return 0
	elsif n == 1
		return 1
	end
	fib2(n-1) + fib(n-2)
end

