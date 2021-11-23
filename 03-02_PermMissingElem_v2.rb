# results: https://app.codility.com/demo/results/trainingKWR5HB-SG3/

def solution(a)
  return 1 if a.empty?

  num_elements = a.length
  min_element = a.min
  max_element = a.max

  return 1 if a.min != 1
  return a.length + 1 if a.max == a.length

  expected_sum = ((num_elements + 1)/ 2.to_f) * (min_element + max_element)
  sum = a.inject(0, :+)

  return (expected_sum - sum).to_i
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 4, solution([1, 2, 3, 5])
  end

  def test_random_order
    assert_equal 4, solution([5, 3, 1, 2])
  end

  def test_zero_elements
    assert_equal 1, solution([])
  end

  def test_one_element
    assert_equal 2, solution([1])
  end

  def test_two_elements
    assert_equal 3, solution([1, 2])
  end

  def test_no_element_missing
    assert_equal 3, solution([1, 2])
    assert_equal 1011, solution((1..1010).to_a)
  end
end
