module Mechanism

  def end_detector(answer)
    return false if right_choice(answer) == :partial
    puts "congratulation"; return true if right_choice(answer) == :full
    puts "Gaveover good luck next time"; return true if verify_trials_number
    false
  end
  def verify_trials_number
    puts @turns_number
    @turns_number -= 1
    if @turns_number == 0
      return true
    end
    puts "you have #{@turns_number} left"
    false
  end

  def right_choice(answer)
    detector = false
    @final_answer.each_with_index do |value, index|
      if value == answer
        grid(value, index)
        detector = true
      end
    end
    if detector
    return :full if @grid_container.join == @final_answer.join
    return :partial
    end
    false
  end

  def grid(value = nil, index =nil)
    @grid_container[index] = value if value
  end
  def display_grid
    puts @grid_container.inspect
  end

  def input_rules
    puts "pls enter your answer"
    input = gets.chomp
    if input.length > 1
      puts "you entered more that a letter"
      input_rules
    elsif stored_input.include?input
      puts "already existed value"
      input_rules
    else
      stored_input(input)
      input
    end
  end
  def stored_input(input = nil)
    @user_input_collection
    @user_input_collection << input unless input == nil
    @user_input_collection
  end
  def build_containers
    @user_input_collection = []
    @grid_container = Array.new(@final_answer.length) {"_"}
  end
end
