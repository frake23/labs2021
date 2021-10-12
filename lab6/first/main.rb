# frozen_string_literal: true

FRAC_RESULT = 1.618033989

def infinite_frac(eps)
  res = 2.0
  res = 1 + 1 / res while (FRAC_RESULT - res).abs > eps
  res
end
