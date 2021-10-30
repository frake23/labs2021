# frozen_string_literal: true

# class that describes behavior of triangle
class Triangle
  def initialize(a_side, b_side, c_side)
    @a_side = a_side
    @b_side = b_side
    @c_side = c_side
  end

  def print
    puts "a - #{@a_side}, b - #{@b_side}, c - #{@c_side}"
  end

  def area(side_a = @a_side, side_b = @b_side, side_c = @c_side)
    per = (side_a + side_b + side_c).to_f / 2
    Math.sqrt per * (per - side_a) * (per - side_b) * (per - side_c)
  end
end

# class that describes behavior of triangle
class Quadrangle < Triangle
  def initialize(a_side, b_side, c_side, d_side, diag)
    super a_side, b_side, c_side
    @d_side = d_side
    @diag = diag
  end

  def print
    puts "a - #{@a_side}, b - #{@b_side}, c - #{@c_side}, d - #{@d_side}, diagonal - #{@diag}"
  end

  def area
    super(@a_side, @b_side, @diag) + super(@c_side, @d_side, @diag)
  end

  attr_reader :a_side, :b_side, :c_side, :d_side, :diag
end
