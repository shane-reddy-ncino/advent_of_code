#!/usr/bin/env ruby

input = []
File.readlines('input.txt', chomp: true).each do |line|
  input << line.chars
end

def movable_roll?(input, r, c, movable_quota = 4)
  roll_count = 0
  # Check row
  roll_count += 1 if (input&.dig(r, c - 1) == '@') && (c - 1 >= 0)
  roll_count += 1 if input&.dig(r, c + 1) == '@'

  # Check column
  roll_count += 1 if (input&.dig(r - 1, c) == '@') && (r - 1 >= 0)
  roll_count += 1 if input&.dig(r + 1, c) == '@'

  # Check across
  roll_count += 1 if input&.dig(r + 1, c + 1) == '@'
  roll_count += 1 if (input&.dig(r - 1, c - 1) == '@') && (r - 1 >= 0) && (c - 1 >= 0)
  roll_count += 1 if (input&.dig(r + 1, c - 1) == '@') && (c - 1 >= 0)
  roll_count += 1 if (input&.dig(r - 1, c + 1) == '@') && (r - 1 >= 0)

  roll_count < 4
end

previous_sum = nil
total_sum = []

new_input = input

while previous_sum != total_sum.sum
  count = 0
  previous_sum = total_sum.sum

  input.each_with_index do |r, ri|
    r.each_with_index do |c, ci|
      if movable_roll?(input, ri, ci) && input&.dig(ri, ci) == '@'
        count += 1
        new_input[ri][ci] = 'x'
      end
    end
  end

  total_sum << count
  input = new_input
end

puts total_sum.sum
