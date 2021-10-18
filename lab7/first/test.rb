# frozen_string_literal: true

require './main'
require 'minitest/autorun'

# Test class of file generations
class TestFiles < Minitest::Unit::TestCase
  def setup
    @expected = []
    generate_f { |w| w.index('a') && expected << w }
    generate_h
  end

  def test_files_exists
    assert_equal true, File.exist?(FILE_H)
    assert_equal true, File.exist?(FILE_F)
  end

  def test_equality
    actual = []
    f = File.open FILE_H, 'r'
    f.each { |w| actual << w.chomp("\n") }
    f.close
    assert_equal expected, actual
  end

  private

  attr :expected, :random
end
