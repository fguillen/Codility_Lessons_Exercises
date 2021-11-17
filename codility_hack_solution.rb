def solution(*args)
  raise Exception.new("args: (#{args.map(&:to_s).join(", ")})")
end

# method(1, 2)
solution([1, 2, 3], "hola")
