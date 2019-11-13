#!/bin/ruby

require 'json'
require 'stringio'

# Complete the plusMinus function below.
def plusMinus(arr)
  positive_count = 0
  negative_count = 0
  zero_count = 0
  length = arr.length

  positive_count = arr.count {|num| num.positive? }
  negative_count = arr.count {|num| num.negative? }
  zero_count = arr.count {|num| num.zero? }
  
  puts (positive_count / length.to_f).round(6)
  puts (negative_count / length.to_f).round(6)
  puts (zero_count / length.to_f).round(6)
end

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

plusMinus arr