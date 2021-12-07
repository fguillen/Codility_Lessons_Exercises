# results 56%: https://app.codility.com/demo/results/trainingWAKRT7-SVC/

def solution(a)
  log("array: #{a}")
  num_elements = a.length
  log("num_elements: #{num_elements}")
  return 0 if num_elements.zero?

  result = 0

  a.each_with_index do |radius, position|
    log("radius: #{radius}, position: #{position}")
    num_elements_on_the_right = [radius, (num_elements - (position + 1))].min
    log("num_elements_on_the_right: #{num_elements_on_the_right}")
    result += num_elements_on_the_right
    log("result: #{result}")
    return -1 if result > 10_000_000

    if((position + radius + 1) < num_elements)
      elements_farther_right = a[(position + radius + 1)..-1]
      log("elements_farther_right: #{elements_farther_right}")
      elements_farther_right_with_collision = elements_farther_right.select.with_index { |e, index| e > index }.count
      log("elements_farther_right_with_collision: #{elements_farther_right_with_collision}")
      result += elements_farther_right_with_collision
      log("result: #{result}")

      return -1 if result > 10_000_000
    end
  end

  result
end

def log(message)
  # puts message
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 11, solution([1, 5, 2, 1, 4, 0])
  end

  def test_general
    assert_equal 0, solution([])
    assert_equal 0, solution([1])
    assert_equal 1, solution([1, 1])
    assert_equal 1, solution([2, 2])
    assert_equal 1, solution([0, 1])
    assert_equal 0, solution([0, 0])
    assert_equal 5, solution([1, 1, 1, 1])
    assert_equal 3, solution([0, 0, 0, 10])
    assert_equal 6, solution([10, 10, 10, 10])
  end

  def test_suite
    assert_equal 15, solution([3, 3, 3, 5, 1, 2])
    assert_equal 5, solution([1, 10, 100, 1])
    assert_equal 3, solution([1, 1, 1])
    assert_equal 6, solution([1, 0, 1, 0, 1])
    assert_equal 41, solution([1, 5, 8, 7, 8, 4, 8, 5, 0, 5])
    assert_equal 176, solution([12, 4, 20, 19, 9, 13, 4, 4, 6, 14, 4, 20, 1, 4, 1, 16, 7, 9, 6, 13])
    assert_equal 1169, solution([7, 31, 8, 36, 30, 19, 31, 28, 2, 27, 31, 26, 44, 37, 19, 11, 6, 41, 35, 31, 22, 25, 11, 27, 7, 31, 32, 34, 12, 4, 16, 35, 26, 38, 21, 20, 46, 8, 10, 30, 32, 22, 28, 22, 34, 45, 42, 32, 23, 48])
    assert_equal 2, solution([1, 2147483647, 0])
    assert_equal 1, solution([2147483647, 2147483647])
  end

  def test_big
    assert_equal(-1, solution([100_000] * 100_000))
    assert_equal(1997, solution([1] * 1_000))
  end

  def test_problematic
  end
end
