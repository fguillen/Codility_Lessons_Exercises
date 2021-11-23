# results

def solution(a)
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 8, solution([1, -2, 0, 9, -1, -2])
  end

  def test_general
    assert_equal -52, solution([0, 1, -3, -3, -3, -3, -2, -3, -100, -100, -100, -100, -100, -50])

  end

  def test_big
    assert_equal 100_000, solution([1] * 100_000)
    # assert_equal 2, solution(0, 2_000_000_000, 2_000_000_000)
  end

  def test_problematic
  end
end


0, 1, -3, -3, -3, -3, -2, -3, -100, -100, -100, -100, -100, -50
