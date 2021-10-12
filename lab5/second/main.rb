# frozen_string_literal: true

def string_analyze(str)
  count = 0
  alphabet = {}
  str.split('').each { |c| (alphabet[c] = (alphabet[c] ? alphabet[c] + 1 : 1)) and count += 1 unless c == ' ' }
  [count, alphabet]
end

def strings_sorter(count)
  arr = []
  0.upto count - 1 do |i|
    s = yield i
    arr << [*string_analyze(s), s]
  end
  arr.sort_by { |i| -i[0] }.map { |i| { str: i[2], data: i[1] } }
end
