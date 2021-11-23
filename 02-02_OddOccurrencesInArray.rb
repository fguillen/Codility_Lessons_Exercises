def solution(a)
  a.uniq.each do |num|
    return num if a.count(num) == 1
  end

  return nil
end
