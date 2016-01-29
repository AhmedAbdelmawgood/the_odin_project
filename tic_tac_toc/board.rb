#top-(left/right/mid) mid(left/right/mid) bottom(left/right/mid)
class Board
  @@movment_number = 0
  def initialize
    grid
  end
  def grid(insertion = nil)
    (1..3).each do |mod|
       puts "-------------------------"
       x = ["|   ","\t|   ","\t|   ","\t|"]
       insert(insertion[mod], x) if insertion
       puts x.join
     end
       puts "-------------------------"
  end
  def insert(input, x)
    input.each_with_index do |cell, index| #cell == 0..2
      x[index] += cell
    end
    x
  end
  def change_board#(arg)
    grid([2,[1,3]])
    #detect_end
  end
  def detect_end
    @@movment_number +=1
    puts "game over #{result}"
  end
end
