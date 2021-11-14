# frozen_string_literal: true

def find_roots(left, right, func = nil, eps = 0.1, &block)
  return nil unless (fun = func || block)

  x_var = left
  y_of_a = fun.call left
  while x_var <= right
    x_var += eps
    y_var = fun.call x_var
    y_var * y_of_a <= 0 ? (return x_var - eps / 2.0) : nil
  end
end

FUNC1 = ->(x) { x**2 + Math.sin(x / 2) - 0 }
FUNC2 = ->(x) { Math.atan(x) + x - 1 }
