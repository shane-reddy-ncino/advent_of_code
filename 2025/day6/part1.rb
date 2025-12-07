#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true).map do |line|
  line.split
end

totals = []
input.transpose.each do |column|
  operator = column.pop
  totals << column.inject(operator == '+' ? 0 : 1) { |result, c| result.public_send(operator, c.to_i) }
  # totals << column.reduce(operator.to)
end

# puts input.transpose.inspect
puts totals.sum
