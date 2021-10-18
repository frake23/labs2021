# frozen_string_literal: true

require './main'
require 'minitest/autorun'

# Test class of finding roots
class TestRoots < Minitest::Unit::TestCase
  def setup
    @func2 = {
      expected: 0.5203, variants: [{ a: -10, b: 5 }, { a: 0, b: 10 }, { a: -100, b: 100 }]
    }
    @func1 = {
      expected: 0, variants: [{ a: -0.2, b: 2 }, { a: -0.1, b: 100 }]
    }
    @func1_second = {
      expected: -0.4949, variants: [{ a: -10, b: 10 }, { a: -1, b: -0.1 }]
    }
  end

  def test_func_one
    func1[:variants].each { |v| assert_in_delta func1[:expected], find_roots(v[:a], v[:b], FUNC1), 0.1 }
  end

  def test_func_two
    func2[:variants].each { |v| assert_in_delta func2[:expected], find_roots(v[:a], v[:b], FUNC2), 0.1 }
  end

  def test_func_one_second
    func1_second[:variants].each { |v| assert_in_delta func1_second[:expected], find_roots(v[:a], v[:b], FUNC1), 0.1 }
  end

  def test_nil
    assert_nil find_roots(0, 1)
  end

  private

  attr :func1, :func2, :func1_second
end
