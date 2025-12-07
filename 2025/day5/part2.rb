#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true).map do |line|
  line
end

fresh_ingredient_ranges = input[0..(input.find_index('') - 1)].map { |m| m.split('-').map(&:to_i) }.uniq

sorted_fresh_ingredient_ranges = fresh_ingredient_ranges.sort_by(&:first)

new_ranges = []
current_start, current_end = sorted_fresh_ingredient_ranges.first

sorted_fresh_ingredient_ranges[1..].each do |s, e|
  if s <= current_end + 1
    current_end = [current_end, e].max
  else
    new_ranges << [current_start, current_end]
    current_start = s
    current_end = e
  end
end

new_ranges << [current_start, current_end]
total = new_ranges.sum { |s, e| e - s + 1 }

puts total
