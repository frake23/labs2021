# frozen_string_literal: true

require './main'

puts 'Введите три стороны'
tr = Triangle.new(*gets.split.map(&:to_i))
tr.print
puts "Площадь треугольника - #{tr.area}"

puts 'Введите 4 стороны и диагональ'
qd = Quadrangle.new(*gets.split.map(&:to_i))
qd.print
puts "Площадь 4-угольника - #{qd.area}"
