#!/usr/bin/env ruby

def split_beams(previous_line, next_lines)
  # base case
  return 0 if next_lines.empty?

  number_of_splits = 0
  current_line = next_lines.first

  previous_line.each_with_index do |pl, i|
    if pl == '|'
      if current_line[i] == '.'
        current_line[i] = '|'
      # this has a ^
      elsif current_line[i] == '^'
        # puts "item #{i}: previous: #{pl} current: #{current_line[i]}"
        number_of_splits += 1
        current_line[i - 1] = '|' if i != 0
        current_line[i + 1] = '|' if i < current_line.size
      end
    end
  end

  # puts current_line.join
  number_of_splits + split_beams(current_line, next_lines.drop(1))
end

input = File.readlines('input.txt', chomp: true).map do |line|
  line.chars
end

total = split_beams(input[0].map { |m| m == 'S' ? '|' : '.' }, input[1..])

puts total
