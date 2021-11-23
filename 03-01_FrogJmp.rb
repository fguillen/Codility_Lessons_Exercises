def solution(x, y, d)
  distance = y - x
  jumps = (distance / d.to_f).ceil

  jumps
end


require "minitest/autorun"
class SolutionTest < Minitest::Test
  def setup
  end

  def test_basic
    assert_equal 3, solution(10, 85, 30)
  end

  def test_zero_jumps
    assert_equal 0, solution(1, 1, 1)
  end

  def test_small_jumps
    assert_equal 1000, solution(1, 1001, 1)
  end

  def test_big_jumps
    assert_equal 1, solution(1, 2, 1000)
  end
end
