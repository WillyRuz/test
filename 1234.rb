def mult(nums)
  array = []
  array2 = []
  aux= nums.first
  
  while aux <= nums.size do
  array2.push(nums.inject(:*)/aux)
  aux += 1
  end
  array2
end

mult([1,2,3,4])