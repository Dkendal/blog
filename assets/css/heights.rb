#!/usr/bin/env ruby
def series
  a = 0.3
  b = 0.85
  x = 0
  y = 13
  n = 10

  (1..n).map do |i|
    ((a * (1.618033 ** (i + x))) * b + y)
  end
end


puts ":root {"

series.each_with_index do |n, idx|
  puts "  --v#{idx}: #{n.ceil}px;"
end

puts "}"
