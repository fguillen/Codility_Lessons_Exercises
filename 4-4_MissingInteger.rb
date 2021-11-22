# results 100%: https://app.codility.com/demo/results/trainingFP32UE-226/

def solution(a)
  a = a.sort
  previous_num = 0

  a.each do |num|
    return previous_num + 1 if (previous_num < num - 1)
    previous_num = num if num > 0
  end

  previous_num + 1
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 5, solution([1, 3, 6, 4, 1, 2])
    assert_equal 4, solution([1, 2, 3])
    assert_equal 1, solution([-1, -2])
  end

  def test_small
    assert_equal 2, solution([1])
    assert_equal 1, solution([-1])
    assert_equal 1, solution([0])
    assert_equal 1, solution([100])
    assert_equal 2, solution([1, 100])
    assert_equal 2, solution([100, 1])
  end

  def test_big
    assert_equal 2, solution(Array.new(100_000, 1))
    assert_equal 1, solution(Array.new(100_000, 0))
    assert_equal 1, solution(Array.new(100_000, -1))
  end

  def test_problematic
  end
end
