#!/usr/bin/env ruby

input = []
File.readlines('input.txt', chomp: true).each do |line|
    input << line
end

position = 50
zero_count = 0

input.each do |line|
    direction = line[0]
    moves = line[1..].to_i

    relative_moves = moves % 100
    zero_count = zero_count + (moves / 100) # Wrap around times it passes

    direction_and_moves = direction == 'L' ? relative_moves * -1 : relative_moves

    relative_dial_position = position + direction_and_moves

    if relative_dial_position < 0
        was_zero = position == 0
        position = relative_dial_position + 100
        zero_count += 1 unless was_zero
    elsif relative_dial_position > 99
        was_zero = position == 0
        position = relative_dial_position - 100
        zero_count += 1 unless was_zero
    else
        position = relative_dial_position
        if position == 0
            zero_count += 1
        end
    end

    # puts "Move [#{line}] : Position #{position} : Zero Count [#{zero_count}]"

end

puts "Zero Count: #{zero_count}"