# frozen_string_literal: true

require './main'

puts 'Введите n'
n = gets.to_i
puts "Введите #{n} строк"

strings_sorter(n) { gets.delete "\n" }.each do |i|
  print "#{i[:str]} - "
  puts(i[:data].map { |k, v| "#{k}: #{v}" }.join(', '))
end
