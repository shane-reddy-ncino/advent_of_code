#!/usr/bin/env ruby

def invalid_id?(array_1, array_2)
    return false if array_1[0].to_s == '0'

    array_1 == array_2
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
        next unless length % 2 == 0

        halfway_index = (length / 2)

        id1_array = id_array[0..(halfway_index - 1)]
        id2_array = id_array[halfway_index..-1]
        # puts "#{id} -> #{id1_array} : #{id2_array}"
        
        invalid_ids_array << id if invalid_id?(id1_array, id2_array)
    end
end

puts invalid_ids_array.sum
