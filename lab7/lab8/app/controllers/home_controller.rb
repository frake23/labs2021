class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def calc
    arr = params[:arr]
    render json: { distances: find_distances(arr) }
  end

  def find_distances(arr)
    arr.reduce([false, []]) do |acc, el|
      is5 = po5? el
      next [false, acc[1]] unless is5
      next [true, acc[1].push([el])] if is5 && !acc[0]
      next [true, acc[1].tap{ |a| a.last.push(el) }] if acc[0] && is5
    end[1]
  end

  def po5?(num)
    return false if num <= 0
    while num != 1
      return false unless (num % 5 == 0)
      num /= 5
    end
    true
  end

  helper_method :find_distances, :po5?
end