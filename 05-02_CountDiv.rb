# results 100%: https://app.codility.com/demo/results/trainingN96G3D-EJE/

def solution(a, b, k)
  first_multiple = (a % k).zero? ? a : a + (k - (a % k))
  last_multiple = (b % k).zero? ? b : b - (b % k)

  # puts ("#{a}, #{b}, #{k}, #{first_multiple}, #{last_multiple}")

  return 0 if (first_multiple > b)

  result = (((last_multiple - first_multiple) + k) / k).to_i

  result
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 3, solution(6, 11, 2)
  end

  def test_small
    assert_equal 1, solution(1, 1, 1)
    assert_equal 0, solution(1, 1, 2)
    assert_equal 1, solution(1, 2, 2)
    assert_equal 2, solution(0, 1, 1)
    assert_equal 11, solution(0, 10, 1)
    assert_equal 6, solution(0, 10, 2)
    assert_equal 4, solution(0, 10, 3)
    assert_equal 0, solution(10, 10, 3)
    assert_equal 1, solution(10, 10, 10)
    assert_equal 1, solution(9, 10, 10)
    assert_equal 1, solution(5, 7, 3)
    assert_equal 2, solution(5, 11, 3)
  end

  def test_big
    assert_equal 2_000_000_001, solution(0, 2_000_000_000, 1)
    assert_equal 2, solution(0, 2_000_000_000, 2_000_000_000)
  end

  def test_problematic
    assert_equal 20, solution(11, 345, 17)
    assert_equal 12345, solution(101, 123_456_789, 10_000)
  end
end
