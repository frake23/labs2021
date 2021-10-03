# frozen_string_literal: true

FRAC_RESULT = 1.618033989

def infinite_frac(eps)
  frac = Enumerator.new do |y|
    res = 2.0
    loop do
      y << res
      res = 1 + 1 / res
    end
  end
  frac.lazy.drop_while { |r| (FRAC_RESULT - r).abs > eps }.take(1).to_a[0]
end
