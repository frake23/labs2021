# frozen_string_literal: true

def string_analyze(str)
  str
    .split('')
    .reject { |s| s == ' ' }
    .each_with_object(Hash.new(0)) { |c, a| a[c] += 1 }
    .then { |this| [this.values.sum, this] }
end

def strings_sorter(count)
  (0..count - 1)
    .each_with_object([]) { |i, a| a << [*string_analyze((s = yield i)), s] }
    .sort_by { |i| -i[0] }
    .map { |i| { str: i[2], data: i[1] } }
end
