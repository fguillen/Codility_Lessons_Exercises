# results: https://app.codility.com/demo/results/trainingK762EF-MH4/#

def solution(a)
  raise ArgumentError.new("Array is empty") if a.empty?
  raise ArgumentError.new("Array has length 1") if a.length == 1

  num_elements = a.length
  min_element = a.min
  max_element = a.max

  raise ArgumentError.new("Not missing element") if max_element - min_element == num_elements - 1

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
    assert_raises(ArgumentError) { solution([]) }
  end

  def test_one_element
    assert_raises(ArgumentError) { solution([1]) }
  end

  def test_two_elements
    assert_equal 4, solution([3, 5])
  end

  def test_no_element_missing
    assert_raises(ArgumentError) { solution([3, 4, 5]) }
    assert_raises(ArgumentError) { solution([100..1010]) }
  end
end
