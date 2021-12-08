# results 100%: https://app.codility.com/demo/results/trainingFHM4JF-7TR/

def solution(a)
  sorted_array = a.sort

  if sorted_array[-1] < 0
    (sorted_array[-1] * sorted_array[-2] * sorted_array[-3])
  elsif sorted_array[0] * sorted_array[1] > sorted_array[-2] * sorted_array[-3]
    (sorted_array[-1] * sorted_array[1] * sorted_array[0])
  else
    (sorted_array[-1] * sorted_array[-2] * sorted_array[-3])
  end
end

def log(message)
  # puts message
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 60, solution([-3, 1, 2, -2, 5, 6])
  end

  def test_general
    assert_equal 1, solution([1, 1, 1])
    assert_equal 0, solution([0, 1, 1])
    assert_equal 0, solution([1, 1, 0])
    assert_equal 0, solution([0, 0, 0])
    assert_equal 12, solution([3, 1, 2, 2])
    assert_equal 4, solution([-3, 1, 2, 2])
    assert_equal 1000, solution([10, 1, 10, 1, 1, 10])
  end

  def test_suite
    assert_equal 125, solution([-5, 5, -5, 4])
  end

  def test_big
    assert_equal 1, solution([1] * 100_000)
    assert_equal 999_970_000_200_000, solution((1..100_000).to_a)
  end

  def test_problematic
  end
end
