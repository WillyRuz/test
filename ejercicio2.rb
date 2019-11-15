def twenty_or_more(numbers)
  new_numbers = []

  numbers.each do |number|
    new_numbers.push(number) if number > 20
  end
  
  new_numbers
end

twenty_or_more([1, 30, 32, 19])
