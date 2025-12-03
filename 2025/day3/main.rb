#!/usr/bin/env ruby

def largest_sequence(digits, k = 12)
    stack = []
    n = digits.length

    digits.each_with_index do |digit, i|
        while !stack.empty? && stack[-1] < digit && (stack.length + (n - i)) > k
            stack.pop
        end

        stack << digit if stack.length < k
    end

    stack.join
end

input = []
File.readlines('input.txt', chomp: true).each do |line|
    input << line
end

joltages = []

input.map(&:chars).each do |array|
    joltages << largest_sequence(array.map(&:to_i)).to_i
end

puts joltages.sum
