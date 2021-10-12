# frozen_string_literal: true

require_relative 'main'

puts 'Введите x и z через пробел'
vars = gets.split.map(&:to_i)
puts func_x_z(*vars)
