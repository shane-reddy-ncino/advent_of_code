#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true).map do |line|
  line
end

fresh_ingredients = []
fresh_ingredient_ranges = input[0..(input.find_index('') - 1)].uniq
available_ingredients = input[(input.find_index('') + 1)..].map(&:to_i).uniq

available_ingredients.each do |ai|
  next if fresh_ingredients.include?(ai)

  fresh_ingredient_ranges.each do |fi|
    range = fi.split('-').map(&:to_i)

    fresh_ingredients << ai if ai.between?(range[0], range[1])
  end
end

# puts fresh_ingredients.inspect
puts fresh_ingredients.uniq.size
