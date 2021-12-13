# results 1005: https://app.codility.com/demo/results/trainingC9DQ2A-E72/

def solution(a)
  length = a.length

  return -1 if length.zero?

  # I can't use `tally` in Ruby 2.2 :/
  groups = a.group_by { |e| e }.map{ |k, v| [k, v.count] }.sort_by { |e| e[1] }

  if(groups.last[1] > (a.length / 2))
    a.index(groups.last[0])
  else
    -1
  end
end

def log(message)
  # puts message
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert([0, 2, 4, 6, 7].include?(solution([3, 4, 3, 2, 3, -1, 3, 3])))
  end

  def test_general
    assert_equal(0, solution([1, 1, 1, 1]))
    assert_equal(-1, solution([1, 2, 2, 1]))
    assert_equal(0, solution([1]))
    assert_equal(-1, solution([0, 1]))
    assert_equal(0, solution([-1, -1]))
    assert_equal(1, solution([1, -1, -1]))
    assert_equal(-1, solution([1, 1, -1, -1]))
  end

  def test_suite
    assert_equal(-1, solution([]))
  end

  def test_big
    assert_equal(0, solution([1] * 100_000))
    assert_equal(-1, solution((1..100_000).to_a))
  end

  # def test_problematic
  # end
end
