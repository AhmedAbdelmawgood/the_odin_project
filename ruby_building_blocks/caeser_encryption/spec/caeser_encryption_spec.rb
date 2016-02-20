require "spec_helper"
describe "clear shifting range" do 
	it "reduce by factor of 26 till be below specific value" do
		x = clear_shifting_range(26, 26)
		y = clear_shifting_range(26, 300)
		z = clear_shifting_range(5, 26)
		expect(x).to be < 26
		expect(y).to be < 26
		expect(z).to be < 5
	end
end
describe prepare_collection do 
	it "s" do 
		is_expected.to eq "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
	end
end
describe "ceaser encryption method" do 
	it "outer letter and symbols" do 
		new_s = caeser('Zz*./\\am', 2)
		expect(new_s).to eq('Bb*./\\co')
	end
end