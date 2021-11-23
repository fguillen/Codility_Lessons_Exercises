# results 100%: https://app.codility.com/demo/results/trainingF5SKAJ-ZGR/

def solution(a, b)
  stack = []
  alive_fishes = 0

  # puts "----------"
  # puts "(#{a}, #{b})"

  a.each_with_index do |size, index|
    direction = b[index]
    # puts "size: #{size}, index: #{index}, direction: ${direction}"

    # Fish going left
    if direction.zero?
      # Fish fight against all the fishes on the left going right
      while !stack.empty? && stack.last < size do
        stack = stack[0..-2]
      end

      # Fish survived
      if stack.empty?
        alive_fishes += 1
      end
    else # is 1, Fish going right
      stack << size
    end

    # puts "stack: #{stack}"
  end

  # Survived fishes going right
  alive_fishes += stack.length

  alive_fishes
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 2, solution([4, 3, 2, 1, 5], [0, 1, 0, 0, 0])
  end

  def test_general
    assert_equal 1, solution([1], [0])
    assert_equal 1, solution([1], [1])
    assert_equal 2, solution([1, 2], [0, 1])
    assert_equal 1, solution([1, 2], [1, 0])
    assert_equal 4, solution([1, 2, 3, 4], [0, 0, 0, 0])
    assert_equal 1, solution([1, 2, 3, 4], [1, 1, 1, 0])
    assert_equal 2, solution([1, 2, 3, 4], [1, 1, 0, 0])
    assert_equal 1, solution([5, 2, 3, 4], [1, 1, 0, 0])
  end

  def test_big
    assert_equal 100_000, solution((1..100_000).to_a, [0] * 100_000)
    assert_equal 1, solution((1..100_000).to_a, ([1] * 99_999) + [0])
  end

  def test_problematic
    assert_equal 2, solution([1, 10, 3, 4], [1, 1, 0, 0])
    assert_equal 3, solution([1, 10, 3, 4], [0, 1, 0, 1])
    assert_equal 5, solution([8, 6, 5, 3, 2, 4, 7], [1, 1, 1, 0, 0, 1, 1])
    assert_equal 2, solution([8, 6, 4, 2, 1, 3, 5], [1, 1, 1, 1, 1, 0, 0])
    assert_equal 16, solution([60784, 686946, 40022, 400519, 657473, 336999, 36846, 8629, 915034, 998496, 924250, 822568, 619077, 276547, 241586, 673773, 30494, 74609, 18604, 810348, 983816, 474571, 222168, 696835, 810107, 549971, 142600, 281896, 987134, 690593, 476768, 58824, 508926, 51353, 771919, 511351, 976304, 595971, 178049, 967459, 234972, 363128, 90978, 112527, 28143, 663596, 905973, 818820, 946713, 388246, 363322, 404614, 344178, 6674, 661321, 621452, 955892, 162267, 312541, 418840, 476262, 341790, 208793, 423207, 558190, 958749, 364193, 356345, 636930, 666411, 135069, 268254, 601457, 52058, 459262, 440055, 145302, 167563, 113832, 770673, 481024, 374754, 842404, 912042, 690115, 189232, 102613, 726328, 815698, 171214, 500012, 384581, 427243, 163524, 518997, 748528, 695896, 274048, 10860, 430154], [0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1])
  end
end
