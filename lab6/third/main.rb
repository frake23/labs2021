# frozen_string_literal: true

def find_roots(a, b, f = nil, eps = 0.1, &block)
  a = a.to_f
  b = b.to_f
  fun = f || block
  return nil unless fun

  x = 0
  loop do
    prev = x
    x = a + (b - a) / 2
    y = fun.call(x)
    y.positive? ? b = x : a = x
    break x if y.abs <= eps && (x - prev).abs <= eps
  end
end

FUNC1 = ->(x) { x**2 + Math.sin(x / 2) - 0 }
FUNC2 = ->(x) { Math.atan(x) + x - 1 }
