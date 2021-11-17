# results 100%: https://app.codility.com/demo/results/trainingGRZHR7-ZH7/

def solution(a)
 sum_total = a.inject(0, :+)
 sum_left = 0
 sum_right = sum_total

 results = []

 (0 .. a.length-2).each do |p|
  sum_left += a[p]
  sum_right -= a[p]
  results.push((sum_left - sum_right).abs)
 end

 result = results.min
 # puts "#{a}, results: #{results}, result: #{result}"

 result
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 1, solution([3, 1, 2, 4, 3])
  end

  def test_other
    assert_equal 3, solution([1, 2, 3, 4, 5])
  end

  def test_two_elements
    assert_equal 2, solution([3, 5])
    assert_equal 2, solution([5, 3])
    assert_equal 9999, solution([10000, 1])
  end

  def test_negative
    assert_equal 200, solution([-100, 100])
    assert_equal 0, solution([-1, -2, -3, -6])
    assert_equal 2, solution([10, 1, 1, -10, -1, -1])
    assert_equal 10, solution([10, 1, 1, -1, -1])
  end

  def test_big
    assert_equal 66232, solution((1..100_000).to_a)
  end

  def test_problematic
    assert_equal 2, solution([10, 1, 1, -10, -1, -1])
  end
end
