#!/usr/bin/env ruby

def invalid_id?(array)
    return false if array.first[0].to_s == '0'

    array.uniq.size == 1
end

input = []
File.readlines('input.txt', chomp: true).each do |line|
    input << line
end

invalid_ids_array = []

# Split by - and always have the lower number as the first element
ranges = input[0].split(',').map{ |i| i.split('-').map(&:to_i).sort }

ranges.each do |range|
    (range[0]..range[1]).each do |id|
        id_array = id.to_s.chars
        length = id_array.size
        # next unless length % 2 == 0
        halfway_index = (length / 2)

        number_of_sets = (length - 1).downto(1).filter{|f| length % f == 0}
        found = false
        number_of_sets.each do |set|
            next if found
            id_arrays = id_array.each_slice(set).to_a
            if invalid_id?(id_arrays)
                invalid_ids_array << id
                found = true
            end
        end
    end
end

puts invalid_ids_array.sum
