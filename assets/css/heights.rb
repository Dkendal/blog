#!/usr/bin/env ruby
a = 0.3
b = 1
x = 0
y = 13
n = 9

puts ":root {"

(0..n).each do |i|
  puts "  --v#{i}: #{((a * (1.618033 ** (i + x))) * b + y).ceil}px;"
end

puts "}"
