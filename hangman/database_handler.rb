class The_database
  attr_reader :data
  def initialize(file_name)
    @data = File.new(file_name, "r")
    format_file #this class is the one that erly on the data base structure and it would change by its change
  end
  def self.setup
    file_name = "5desk.txt"
    The_database.new(file_name)
  end
  #private :format_file
  def format_file
    @data = @data.inject({}) do |hash, word|
      word = word[0..word.length-3]
      first_letter = word[0].upcase.to_sym
      hash[first_letter] ||= []
      hash[first_letter] << word.downcase
      hash
    end
  end
  def retrieve_random_word
    random_letter = rand(65..90).chr.to_sym
    group_length = data[random_letter].length
    the_word = data[random_letter][rand(group_length)]
    return the_word if (5..12) === the_word.length
    retrieve_random_word
  end

end
