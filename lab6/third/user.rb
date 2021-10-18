# frozen_string_literal: true

require './main'

puts "Корень на [-1, 1] для f1\nКак блок #{find_roots(-0.2, 1) do |x|
  FUNC1.call(x)
end }\nКак лямбда #{find_roots(-0.2, 1, FUNC1)}"

puts "\nКорень на [0, 1] для f2\nКак блок #{find_roots(0, 1) do |x|
  FUNC2.call(x)
end }\nКак лямбда #{find_roots(0, 1, FUNC2)}"
