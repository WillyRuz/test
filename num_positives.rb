def num_positives(numbers)
  new_numbers = []

  numbers.each do |number|
    new_numbers.push(number) if number.positive?
  end

  new_numbers
end

num_positives([-1, 20, 4])
