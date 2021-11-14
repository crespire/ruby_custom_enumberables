require_relative 'main'

puts 'Testing #each'
arr = [1, 2, 3, 4]
arr2 = [12, 27, 1, 99, 12, 'a']
arr3 = ['testing', :are_we_sure, 'this', [5, 6], 'works', Random.new]

puts 'Array 1'
p arr.each
p arr.my_each
puts 'Testing #each block, output should be duplicated'
p arr.each { |item| p item }
p arr.my_each { |item| p item }

puts '=================='
puts 'Array 2'
p arr2.each
p arr2.my_each
puts 'Testing #each block, output should be duplicated'
p arr2.each { |item| p item }
p arr2.my_each { |item| p item }

puts '=================='
puts 'Array 3'
p arr3.each
p arr3.my_each
puts 'Testing #each block, output should be duplicated'
p arr3.each { |item| p item }
p arr3.my_each { |item| p item }




puts " "
print "Press enter to move on to #each_with_index tests"
gets
system('clear') || system('cls')





puts 'Array 1'
p arr.each_with_index
p arr.my_each_with_index
p arr.each_with_index(1,2)
p arr.my_each_with_index(1,2)
puts 'Testing #each block, output should be duplicated'
p arr.each_with_index { |item, index| puts "#{index}: #{item}" }
p arr.my_each_with_index { |item, index| puts "#{index}: #{item}" }

puts '=================='
puts 'Array 2'
p arr2.each_with_index
p arr2.my_each_with_index
p arr2.each_with_index(1,2)
p arr2.my_each_with_index(1,2)
puts 'Testing #each block, output should be duplicated'
p arr2.each_with_index { |item, index| puts "#{index}: #{item}" }
p arr2.my_each_with_index { |item, index| puts "#{index}: #{item}" }

puts '=================='
puts 'Array 3'
p arr3.each_with_index
p arr3.my_each_with_index
p arr3.each_with_index(1,2)
p arr3.my_each_with_index(1,2)
puts 'Testing #each block, output should be duplicated'
p arr3.each_with_index { |item, index| puts "#{index}: #{item}" }
p arr3.my_each_with_index { |item, index| puts "#{index}: #{item}" }



puts " "
print "Press enter to move on to #my_all? tests"
gets
system('clear') || system('cls')

puts "There should be 6 true evaluations, as each line runs built in all against my_all and checks if results are equal"
p %w[ant bear cat].all? { |word| word.length >= 3 } == %w[ant bear cat].my_all? { |word| word.length >= 3 }
p %w[ant bear cat].all? { |word| word.length >= 4 } == %w[ant bear cat].my_all? { |word| word.length >= 4 }
p %w[ant bear cat].all?(/t/) == %w[ant bear cat].my_all?(/t/)
p [1, 2i, 3.14].all?(Numeric) == [1, 2i, 3.14].my_all?(Numeric)
p [nil, true, 99].all? == [nil, true, 99].my_all?
p [].all? == [].my_all?




puts " "
print "Press enter to move on to #my_any? tests"
gets
system('clear') || system('cls')

puts "Like before, there should be 6 true evaluations below."
p %w[ant bear cat].any? { |word| word.length >= 3 } == %w[ant bear cat].my_any? { |word| word.length >= 3 }
p %w[ant bear cat].any? { |word| word.length >= 4 } == %w[ant bear cat].my_any? { |word| word.length >= 4 }
p %w[ant bear cat].any?(/d/) == %w[ant bear cat].my_any?(/d/)
p [nil, true, 99].any?(Integer) == [nil, true, 99].my_any?(Integer)
p [nil, true, 99].any? == [nil, true, 99].my_any?
p [].any? == [].my_any?