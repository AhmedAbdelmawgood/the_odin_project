
def split_word(string)
	string.split("")
end

def prepare_collection
	alpha = "abcdefghijklmnopqrstuvwxyz"
	alpha << alpha.upcase
	alpha =  alpha.split("")
end

def caeser(string, shift)
	alpha = prepare_collection
	sentence = split_word(string)
	sentence.map! {|letter| 
		if alpha.include?letter
			index = alpha.index(letter)
			shifting_number = index + shift
			corrected_factor = (index <=26)? clear_shifting_range(26, shifting_number) : clear_shifting_range(52, shifting_number)
			#puts "#{letter} t#{shifting_number}/#{corrected_factor}o  /#{index}/  #{alpha[corrected_factor]}"
			letter = alpha[corrected_factor]	
		else
			letter
		end
	 }
	 sentence.join
end
def clear_shifting_range(targe_range, shifting_number)
	while shifting_number >= targe_range 
	shifting_number -= 26
	end 
	shifting_number
end
p caeser("ahmedb samirZ",1)

