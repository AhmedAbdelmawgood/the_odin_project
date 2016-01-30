class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end
  def respond 
    gets.chomp
  end
end
