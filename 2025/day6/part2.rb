#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true).map do |line|
  line.chars
end

totals = []
operator = nil
new_calc = []

new_column = []
input.transpose.each do |column|
  if operator.nil?
    operator = column[-1]
    new_column << operator
  end

  if column.uniq.size == 1
    new_calc << new_column.reverse
    new_column = []
    operator = nil
    next
  end

  new_column << column[0..-2].reject { |r| [' ', '*', '+'].include?(r) }.join.to_i unless operator.nil?
end
new_calc << new_column.reverse

new_calc.each do |column|
  operator = column.pop
  totals << column.inject(operator == '+' ? 0 : 1) { |result, c| result.public_send(operator, c.to_i) }
end

puts totals.sum
