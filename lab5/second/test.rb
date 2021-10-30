# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Application's functions testing
class TestAnalyzer < MiniTest::Unit::TestCase
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def setup
    @res = []
    rand(1..10).downto 1 do # Количество предложений
      words = (1..rand(1..10)).reduce(['', Hash.new(0), 1]) do |a| # Количество слов
        s, h, count = a
        letters = rand(1..10)
        count += letters
        letters.downto 1 do # Количество букв
          l = ('a'..'z').to_a[rand(26)]
          h[l] = h[l] ? h[l] + 1 : 1
          s += l
        end
        ["#{s} ", h, count]
      end
      res << { str: words[0], data: words[1], count: words[2] }
    end
    res.sort_by! { |i| -i[:count] }.map { |i| i.tap { |item| item.delete(:count) } }
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def test_generated
    assert_equal res, strings_sorter(res.length) { |i| res[i][:str] }
  end

  private

  attr :res
end
