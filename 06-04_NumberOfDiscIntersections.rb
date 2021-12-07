# results 12%: https://app.codility.com/demo/results/trainingSSC27X-7SP/

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
    return -1 if result > 10_000_000

    if((position + radius + 1) < num_elements)
      elements_farther_right = a[(position + radius + 1)..-1]
      log("elements_farther_right: #{elements_farther_right}")

      result += elements_farther_right.select.with_index { |e, index| e > index + radius }.count

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
    assert_equal 3, solution([1, 1, 1, 1])
    assert_equal 3, solution([0, 0, 0, 10])
    assert_equal 6, solution([10, 10, 10, 10])
  end

  def test_big
    assert_equal(-1, solution([100_000] * 100_000))
    assert_equal(999, solution([1] * 1_000))
  end

  def test_problematic
  end
end
