def mult(nums)
  numbers_list = []
  
  nums.each do |iterator|
    numbers_list.push(nums.inject(:*)/iterator)
  end

  numbers_list
end

mult([1, 2, 3, 4])