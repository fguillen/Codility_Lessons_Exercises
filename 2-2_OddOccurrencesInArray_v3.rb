# results: https://app.codility.com/demo/results/trainingB8UNK9-PS6/

def solution(a)
  a.group_by { |e| e }.each { |k, v| return v.first if v.length.odd? }
  return nil
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 7, solution([9, 3, 9, 3, 9, 7, 9])
  end

  def test_big
    array = (1..1_000_000).to_a
    array += (1..1_000_000).to_a
    array.push(1_000_001)
    assert_equal 1_000_001, solution(array)
  end

  def test_one_element
    assert_equal 1, solution([1])
  end
end
