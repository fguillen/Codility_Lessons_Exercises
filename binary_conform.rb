def solution(a, b, c)
  a_binary = a.to_s(2).rjust(30, '0')
  b_binary = b.to_s(2).rjust(30, '0')
  c_binary = c.to_s(2).rjust(30, '0')

  results = a_binary.count('0')
  results += variations(b_binary, 0)
  results += variations(c_binary, 0)

  results = results.uniq

  results.map { |e| e.to_i(2) }.sort
end

# recursive call
def variations(num_binary, position)
  puts("variations(#{num_binary}, #{position})")
  index_zero = num_binary.index('0', position)
  return if index_zero.nil?

  results = []
  results.push(num_binary)

  # with 0 in index_zero
  new_versions = variations(num_binary, index_zero + 1)
  results += new_versions unless new_versions.nil?

  # with 1 in index_zero
  new_version = num_binary.dup
  new_version[index_zero] = '1'
  results.push(new_version)

  new_versions = variations(new_version, index_zero + 1)
  results += new_versions unless new_versions.nil?

  results
end

puts solution(10, 0, 0)
# puts solution(1_073_741_727, 0, 0)
# puts solution(1_073_741_727, 1_073_741_631, 1_073_741_679)
# puts solution(100, 0, 0)
# puts solution(1001, 0, 0)

# 11 1111 1111 1111 1111 1111 0011 1111(BIN) = 1,073,741,631,
# 11 1111 1111 1111 1111 1111 0110 1111(BIN) = 1,073,741,679,
# 11 1111 1111 1111 1111 1111 0111 1111(BIN) = 1,073,741,695, *
# 11 1111 1111 1111 1111 1111 1001 1111(BIN) = 1,073,741,727,
# 11 1111 1111 1111 1111 1111 1011 1111(BIN) = 1,073,741,759, *
# 11 1111 1111 1111 1111 1111 1101 1111(BIN) = 1,073,741,791, *
# 11 1111 1111 1111 1111 1111 1110 1111(BIN) = 1,073,741,807, *
# 11 1111 1111 1111 1111 1111 1111 1111(BIN) = 1,073,741,823. *
