# frozen_string_literal: true

require './main'
require 'minitest/autorun'

# Test of frac
class TestFrac < Minitest::Unit::TestCase
  def test_first
    assert_in_delta FRAC_RESULT, infinite_frac(0.001), 0.001
  end

  def test_second
    assert_in_delta FRAC_RESULT, infinite_frac(0.0001), 0.0001
  end

  def test_third
    assert_in_delta FRAC_RESULT, infinite_frac(0.00001), 0.00001
  end
end
