#!/bin/ruby

require 'json'
require 'stringio'

# Complete the staircase function below.
def staircase(n)
  i=1
  
  while (i <= n) do
    puts " " * (n-i) + "#" * i
    i += 1
  end
end

n = gets.to_i

staircase n

