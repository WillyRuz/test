#!/bin/ruby

require 'json'
require 'stringio'

# Complete the staircase function below.
def staircase(n)
  space=1
  
  while (space <= n) do
    puts " " * (n - space) + "#" * space
    space += 1
  end
end

n = gets.to_i

staircase n

