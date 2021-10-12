# frozen_string_literal: true

def find_roots(left, right, func = nil, eps = 0.1, &block)
  left = left.to_f
  right = right.to_f
  return nil unless (fun = func || block)

  x = 0
  loop do
    prev = x
    x = left + (right - left) / 2
    (y = fun.call(x)).positive? ? right = x : left = x
    break x if y.abs <= eps && (x - prev).abs <= eps
  end
end

FUNC1 = ->(x) { x**2 + Math.sin(x / 2) - 0 }
FUNC2 = ->(x) { Math.atan(x) + x - 1 }
