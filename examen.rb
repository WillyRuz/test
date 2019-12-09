def method(nums = {})

  nums.each do |key, value|
    case value
    when value -10..0
    puts "sin fico"
    when 0..10
      puts "con poco fico"
    when 11..20
      puts "con fico regular"
    end

  end
end

method({ "num1" => -1 , "num2" => 15})
