# results 100%: https://app.codility.com/demo/results/trainingB726VT-XJF/

def solution(a)
  a.uniq.count
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 3, solution([2, 1, 1, 2, 3, 1])
  end

  def test_general
    assert_equal 0, solution([])
    assert_equal 1, solution([2])
    assert_equal 1, solution([2, 2, 2, 2])
    assert_equal 3, solution([2, 2, 1, -1])
  end

  def test_big
    assert_equal 100_000, solution((1..100_000).to_a)
  end

  def test_problematic
  end
end
