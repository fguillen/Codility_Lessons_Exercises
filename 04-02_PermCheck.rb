# results 100%: https://app.codility.com/demo/results/trainingBXPZFM-8MZ/

def solution(a)
  a_max = a.max

  count = 0
  expected_count = a.max
  registered_nums = {}

  a.each do |num|
    return 0 if !registered_nums[num].nil?

    registered_nums[num] = true
    count += 1
  end

  (count == expected_count) ? 1 : 0
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 1, solution([4, 1, 3, 2])
    assert_equal 0, solution([4, 1, 3])
  end

  def test_small
    assert_equal 1, solution([1])
    assert_equal 1, solution([1, 2])
    assert_equal 0, solution([2])
    assert_equal 0, solution([2, 3])
    assert_equal 0, solution([3, 2])
    assert_equal 0, solution([2, 3, 5])
  end

  def test_duplicate
    assert_equal 0, solution([1, 1])
    assert_equal 0, solution([1, 2, 1])
  end

  def test_big
    assert_equal 1, solution((1..100_000).to_a)
  end

  def test_problematic
    assert_equal 0, solution([1_000_000_000])
  end
end
