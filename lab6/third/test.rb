# frozen_string_literal: true

require './main'
require 'minitest/autorun'

# Test class of finding roots
class TestRoots < Minitest::Unit::TestCase
  def setup
    @func2 = {
      expected: 0.5203,
      variants: [
        { a: -10, b: 5 },
        { a: 0, b: 10 },
        { a: -100, b: 100 }
      ]
    }
    @func1 = {
      expected: 0,
      variants: [
        { a: -0.2, b: 2 },
        { a: -0.1, b: 100 }
      ]
    }
  end

  def test_1
    @func1[:variants].each { |v| assert_in_delta @func1[:expected], find_roots(v[:a], v[:b], FUNC1), 0.1 }
  end

  def test_2
    @func2[:variants].each { |v| assert_in_delta @func2[:expected], find_roots(v[:a], v[:b], FUNC2), 0.1 }
  end

  def test_3
    assert_nil find_roots(0, 1)
  end
end
