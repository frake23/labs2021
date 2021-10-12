# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Application's functions testing
class TestAnalyzer < MiniTest::Unit::TestCase
  def setup
    @res = []
    rand(1..10).downto 1 do # Количество предложений
      s = ''
      h = {}
      count = 1
      rand(1..10).downto 1 do # Количество слов
        letters = rand(1..10)
        count += letters
        letters.downto 1 do # Количество букв
          l = ('a'..'z').to_a[rand(26)]
          h[l] = h[l] ? h[l] + 1 : 1
          s += l
        end
        s += ' '
      end
      @res << { str: s, data: h, count: count }
    end
    @res.sort_by! { |i| -i[:count] }.map { |i| i.tap { |item| item.delete(:count) } }
  end

  def test_1
    assert_equal @res, strings_sorter(@res.length) { |i| @res[i][:str] }
  end
end
