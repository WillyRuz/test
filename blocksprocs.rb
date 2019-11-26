def calculate(num1, num2)
   puts yield(num1, num2)
end

calculate(15, 10) {|num1, num2| num1 - num2}
calculate(15, 10) {|num1, num2| num1 + num2}
calculate(15, 10) {|num1, num2| num1 * num2}
calculate(15, 10) {|num1, num2| num1 / num2}