i = 0
numbers = []

while i < 6
  puts "At the top i is #{i}"
  numbers.push(i)

  i += 1
  puts "Numbers now: #{numbers}"
  puts "At the bottom i is #{i}"
end

puts "The numbers: "

for num in numbers
  puts num
end

def repeat(n, m)
  i = 1
  arr = []
  while i < n
    i *= m
    arr << i
    puts "#{arr}"
  end
end

repeat 29, 3

def for_in(r)
  for i in [*r]
    print "#{i}, "
  end
end

puts "Starting for method"
for_in 1..5
