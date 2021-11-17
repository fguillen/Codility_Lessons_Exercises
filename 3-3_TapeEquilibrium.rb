# results:

require "json"
def solution(a)
 sum_total = a.inject(0, :+)
 sum_left = 0
 sum_right = sum_total

 results = []

 a.length.times do |p|
  sum_left += a[p]
  sum_right -= a[p]
  results.push([p, (sum_left - sum_right).abs])
 end



 results = results.sort_by { |e| e[1] }

 print JSON.pretty_generate(results)

 results[0][0] + 1
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 1, solution([3, 1, 2, 4, 3])
  end

  def test_other
    assert_equal 3, solution([1, 2, 3, 4, 5])
  end

  def test_two_elements
    assert_equal 1, solution([3, 5])
    assert_equal 1, solution([5, 3])
    assert_equal 1, solution([10000, 1])
  end

  def test_negative
    assert_equal 1, solution([-100, 100])
    assert_equal 3, solution([-1, -2, -3, -6])
    assert_equal 3, solution([10, 1, 1, -10, -1, -1])
  end

  # def test_big
  #   assert_equal 1, solution((1..100_000).to_a)
  # end
end
