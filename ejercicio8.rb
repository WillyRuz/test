def get_num(numbers)
  num_sum = 0

  numbers.each do |number|
    number = number.to_s
    first_reverse = number.reverse
    first_number = number.reverse.index("0")
    num_sum += first_reverse.slice(0..first_number-1).reverse.to_i \
    if number.reverse.byteslice(0).to_i != 0
  end
  
  num_sum
end

numbers = [1200000265, 1000002360,1670000800, 1000006002, 1000000233]
get_num(numbers)