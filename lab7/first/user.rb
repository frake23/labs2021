# frozen_string_literal: true

require './main'

puts "Файл F\n\n"
generate_f { |w| puts w }

puts "\nФайл H\n\n"
generate_h { |w| puts w }
