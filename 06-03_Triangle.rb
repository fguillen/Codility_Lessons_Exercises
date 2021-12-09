# results 100%: https://app.codility.com/demo/results/training4FDGC7-CN7/

def solution(a)
  a_selection = a.select { |e| e > 0 }
  return 0 if a_selection.length < 3

  a_selection_sorted = a_selection.sort.reverse

  log("a_selection_sorted: #{a_selection_sorted}")

  (0..(a_selection_sorted.length - 3)).each do |index|
    log("index: #{index}")
    if(
      (a_selection_sorted[index] + a_selection_sorted[index + 1] > a_selection_sorted[index + 2]) &&
      (a_selection_sorted[index + 1] + a_selection_sorted[index + 2] > a_selection_sorted[index]) &&
      (a_selection_sorted[index + 2] + a_selection_sorted[index] > a_selection_sorted[index + 1])
    )
      log("IS 1!")
      return 1
    end
  end

  return 0
end

def log(message)
  # puts message
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 1, solution([10, 2, 5, 1, 8, 20])
    assert_equal 0, solution([10, 50, 5, 1])
  end

  def test_general
    assert_equal 0, solution([])
    assert_equal 0, solution([1, 1])
    assert_equal 1, solution([1, 1, 1])
    assert_equal 0, solution([0, 0, 0])
    assert_equal 0, solution([-1, 1, 1])
    assert_equal 0, solution([2, 1, 1])
    assert_equal 1, solution([2, 2, 1])
    assert_equal 1, solution([2, 2, 1, 2])
    assert_equal 0, solution([-1, -1, -1])
    assert_equal 0, solution([1, 2, 3])
    assert_equal 1, solution([4, 5, 6])
    assert_equal 1, solution([1, 2, 3, 4])
    assert_equal 1, solution([1, 2, 3, 2])
    assert_equal 1, solution([100, 50, 50, 2, 2, 2])
  end

  def test_suite
  end

  def test_big
    assert_equal 1, solution([1] * 100_000)
    assert_equal 0, solution(([0] * 100_000))
    assert_equal 0, solution([-1] * 100_000)
    assert_equal 1, solution((1..100_000).to_a)
  end

  def test_problematic
  end
end
