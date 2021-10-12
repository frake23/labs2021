# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test class of function f
class TestFunction < MiniTest::Unit::TestCase
  def setup
    @true_values = [
      { x: -0.567, z: 0, y: 0.413 },
      { x: -2.102, z: 1, y: 0 },
      { x: -1.797, z: 2.2, y: 3.474 },
      { x: -1.847, z: 6.6, y: 0.97 },
      { x: -3.447, z: -5.6, y: 0.421 }
    ]
  end

  def test1
    @true_values.each { |dot| assert_in_delta dot[:y], func_x_z(dot[:x], dot[:z]), 0.01 }
  end
end
