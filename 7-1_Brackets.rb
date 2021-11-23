# results 100%: https://app.codility.com/demo/results/trainingYVKNRZ-DTQ/

def solution(s)
  stack = []
  opposites = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
  }

  # catching
  opposites_inverted = opposites.invert
  opposites_keys = opposites.keys
  opposites_values = opposites.values

  s.each_char do |char|
    case char
    when *opposites_keys
      stack << char
    when *opposites_values
      if stack[-1] == opposites_inverted[char]
        stack = stack[0..-2]
      else
        return 0
      end
    end
  end

  return stack.empty? ? 1 : 0
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 1, solution("")
    assert_equal 1, solution("{[()()]}")
    assert_equal 0, solution("([)()]")
  end

  def test_general
    assert_equal 0, solution("(()()]")
    assert_equal 1, solution("(((())))")
    assert_equal 1, solution("(())(())")
    assert_equal 0, solution("(())(()))")
    assert_equal 1, solution("()[]")
    assert_equal 1, solution("()[]{}")
    assert_equal 1, solution("(()[]{})")
  end

  def test_big
    assert_equal 1, solution("()" * 100_000)
    assert_equal 0, solution("()" * 100_000 + ")")
  end

  def test_problematic
    assert_equal 0, solution("(([))]")
  end
end
