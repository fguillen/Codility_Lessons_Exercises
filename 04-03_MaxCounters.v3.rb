# results 100%: https://app.codility.com/demo/results/training9XQY9F-JHT/

def solution(n, a)
  result = Array.new(n, 0)
  max = 0;
  last_operation_max = false

  a.each do |element|
    if element == n + 1
      result = Array.new(n, max) if !last_operation_max
      last_operation_max = true
    else
      result[element - 1] += 1
      max = result[element - 1] if result[element - 1] > max
      last_operation_max = false
    end

    # puts "element: #{element}, result: #{result}"
  end

  result
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal [3, 2, 2, 4, 2], solution(5, [3,4,4,6,1,4,4])
  end

  def test_small
    assert_equal [1], solution(1, [1])
    assert_equal [3], solution(1, [1, 1, 1])
    assert_equal [3, 0], solution(2, [1, 1, 1])
    assert_equal [3, 1], solution(2, [1, 1, 1, 2])
    assert_equal [3, 3], solution(2, [1, 1, 1, 3])
  end

  def test_big
    assert_equal [100_000], solution(1, Array.new(100_000, 1))
    assert_equal [100_000, 0], solution(2, Array.new(100_000, 1))
  end

  def test_problematic
    assert_equal Array.new(100_000, 0), solution(100_000, Array.new(100_000, 100_001))
  end
end
