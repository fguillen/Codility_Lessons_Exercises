# results 100%: https://app.codility.com/demo/results/trainingQWATY6-MH9/

def solution(x, a)
  river_spaces = []
  river_spaces_with_leaf = 0

  a.each_with_index do |leaf_position, index|
    if(!leaf_position.zero? && river_spaces[leaf_position].nil?)
      river_spaces[leaf_position] = 1
      river_spaces_with_leaf += 1

      return index if(river_spaces_with_leaf == x)
    end
  end

  return -1
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 6, solution(5, [1, 3, 1, 4, 2, 3, 5, 4])
  end

  def test_small
    assert_equal 0, solution(1, [1])
    assert_equal 1, solution(1, [0, 1])
    assert_equal 3, solution(1, [0, 0, 0, 1])
    assert_equal 3, solution(1, [0, 0, 0, 1, 0])
    assert_equal 4, solution(2, [0, 0, 0, 2, 1])
  end

  def test_big
    assert_equal 99_999, solution(100_000, (1..100_000).to_a)
  end

  def test_problematic
    assert_equal -1, solution(5, [3])
  end
end
