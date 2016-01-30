class Array
  def validate_uniqueness?
    self.length == self.uniq.length
  end
  def order_values_match?(another_array)
    self.each_with_index.all? do |value, index|
      value == another_array[index]
    end
  end
end
