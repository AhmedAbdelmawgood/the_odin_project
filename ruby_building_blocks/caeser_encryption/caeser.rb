
def caeser(string,number)
	@number = number
	@alpha="abcdefghijklmnopqrstuvwxyz"
	@alpha << @alpha.upcase
	@alpha =  @alpha.split("")
	step_one= string.split("")
	step_one.map! {|x| 
		if @alpha.index(x)
			@inde = @alpha.index(x)

			def action(iter_fact)
				shift=@inde+@number
				while shift >= iter_fact 
					shift -= 26
				end 
				x = @alpha[shift]
			end

			if @inde <=26
				action(26)
			else
				action(52)
			end
		else
			x 
		end
	 }
	 step_one.join
end
p caeser("ahmed samirZ",1)

