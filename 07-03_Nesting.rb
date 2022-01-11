# results 100%: https://app.codility.com/demo/results/training3UN95M-PVV/

def solution(s)
  open = 0
  s.each_char do |char|
    case char
    when "("; open += 1
    when ")"; open -= 1
    end

    return 0 if open < 0
  end

  return open == 0 ? 1 : 0
end

require "minitest/autorun"
class SolutionTest < Minitest::Test
  def test_basic
    assert_equal 1, solution("(()(())())")
    assert_equal 0, solution("())")
  end

  def test_general
    assert_equal 1, solution("")
    assert_equal 1, solution("()()")
    assert_equal 1, solution("()()()")
    assert_equal 0, solution("(")
    assert_equal 0, solution(")")
    assert_equal 1, solution("(())")
    assert_equal 1, solution("(((())))")
  end

  def test_big
    assert_equal 1, solution("()" * 500_000)
    assert_equal 0, solution("(" * 1_000_000)
  end

  def test_problematic
  end
end
