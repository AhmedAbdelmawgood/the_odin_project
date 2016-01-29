class Player
  @@alternate = true
  attr_accessor :name, :symbol
  def initialize(name)
    @name = name
    if @@alternate
      @symbol = "x"
      @@alternate = false
    else
      @symbol = "o"
    end
  end
end
