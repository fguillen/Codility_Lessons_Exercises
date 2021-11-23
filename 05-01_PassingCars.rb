# results 100%: https://app.codility.com/demo/results/trainingCH64MV-ZZ7/

def solution(a)
  cars_going_east = 0
  result = 0

  a.each do |car|
    cars_going_east += 1 if car.zero?
    result += cars_going_east if !car.zero?

    return -1 if result > 1_000_000_000
  end

  result
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 5, solution([0, 1, 0, 1, 1])
  end

  def test_small
    assert_equal 0, solution([1])
    assert_equal 0, solution([0])
    assert_equal 1, solution([0, 1])
    assert_equal 0, solution([1, 0])
    assert_equal 4, solution([0, 1, 1, 1, 1])
    assert_equal 4, solution([0, 1, 1, 1, 1, 0, 0])
    assert_equal 7, solution([0, 1, 1, 1, 1, 0, 0, 1])
  end

  def test_big
    assert_equal 0, solution(Array.new(100_000, 1))
    assert_equal 0, solution(Array.new(100_000, 0))
    assert_equal 100_000, solution(Array.new(100_000, 0).push(1))
    # assert_equal 2_500_000_000, solution([0] * 50_000 + [1] * 50_000)
    assert_equal -1, solution([0] * 50_000 + [1] * 50_000)
  end

  def test_problematic
  end
end
