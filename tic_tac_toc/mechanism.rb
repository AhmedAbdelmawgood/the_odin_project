module Mechanism

  @@round_number = 0
  def check(cells, player_sym)
    return winner(cells)
    if round_number
      puts "No one had won!!"
      exit
    end
  end

  def round_number
    @@round_number +=1
    puts(@@round_number)
    false
    if @@round_number == 10
      puts @@round_number
      @@round_number = 0
      return true
    end
    return false
  end

  def winner(cells)
    return true if check_the_row_win(cells) #check the win in the row
    return true if check_the_vertical_win(cells)
    return true if check_the_inclined_win(cells)
    false
  end

  def check_the_row_win(cells)
    (1..3).each {|x|  return true if ((cells[x].uniq.length == 1) && !(cells[x].include?"")) }
    false
  end
  def check_the_vertical_win(cells)
    n = []
    (0..2).each do |num| #check the win in the column
      (1..3).each {|x| n << cells[x][num]}
      return true if n.uniq.length == 1 && !(n.include?"")
      n=[]
      end
      false
  end

  def check_the_inclined_win(cells)
    n=[]          #first case
    (1..3).each do |x|
      n << cells[x][x-1]
    end
      return true if n.uniq.length == 1 && !(n.include?"")
    n = []          #second case
    (1..3).each do |x|
      n << cells[x][3-x]
      end
      return true if n.uniq.length == 1 && !(n.include?"")
      false
  end

  def convert_to_coordinate(input)
    answer = input
    coordinate = ["",""]
    case answer[0]
    when "t" then coordinate[0] = 1
    when "m" then coordinate[0] = 2
    when "b" then coordinate[0] = 3
    end
    case answer[1]
    when "l" then coordinate[1] = 0
    when "m" then coordinate[1] = 1
    when "r" then coordinate[1] = 2
    end
  coordinate
  end

  def clearify
    begin
      input = gets.chomp
      raise "you enterd a wrong answer" if input[/^.*(tl)|(tm)|(tr)|(ml)|(mm)|(mr)|(bl)|(bm)|(br)/i].nil?
      input[/^.*(tl)|(tm)|(tr)|(ml)|(mm)|(mr)|(bl)|(bm)|(br)/i]
    rescue => e
      puts e
      retry
    end
  end

end
