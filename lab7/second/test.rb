# frozen_string_literal: true

require './main'
require 'minitest/autorun'

# Test class of figures
class FTest < Minitest::Unit::TestCase
  def setup
    @tri = Triangle.new 3, 4, 5
    @quad = Quadrangle.new 3, 3, 3, 4, 5
  end

  def test_area
    assert_equal 6, @tri.area
    assert_in_delta 10.15, @quad.area, 0.01
  end

  def test_inheritance
    assert @tri.instance_of?(Triangle)
    assert @quad.instance_of?(Quadrangle)
    assert @quad.class < Triangle
  end
end
