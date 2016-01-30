module Mechanism
  OPTIONS = ["red", "blue", "green", "pink", "black", "white", "brown"]
  def verify_choices(the_choices, choices_number = "4")
    return false unless right_number_of_colors?(the_choices, choices_number.to_i)
    return false unless from_the_default_options?(the_choices)
    return false unless the_choices.validate_uniqueness? #array extension
    true
  end
  def right_number_of_colors?(the_choices, choices_number)
    (4..choices_number) === the_choices.length
  end
  def from_the_default_options?(the_choices)
    the_choices.each { |choice| return false unless OPTIONS.include?choice }
  end
  def end_detector(the_guess, final_answer, turns = 12)
    return :winner if verify_match(the_guess, final_answer)
    return :loser if verify_turns_number(turns)
    false
  end
  def verify_turns_number(turns)
    @turns_number += 1
    if @turns_number == turns
      return true
      @turns_number = 0
    end
    false
  end
  def verify_match(the_guess, final_answer)
    return true if final_answer.order_values_match?(the_guess) #array extension
    append_to_grid(the_guess, final_answer)
    false
  end
  def append_to_grid(the_guess, final_answer)
    add_value = []
    the_guess.each_with_index do |value, index|
      if final_answer[index] == value
        add_value << true
      elsif final_answer.include?value
        add_value << "exist"
      else
         add_value << false
       end
    end
    grid_print(the_guess, add_value)
  end
  def grid_print(the_guess = nil, add_value = ["____","____","____","____"])
    puts the_guess.inspect if the_guess
    puts add_value.inspect
  end
end
