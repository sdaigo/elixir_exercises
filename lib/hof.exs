res = Enum.each([1, 2, 3], fn x -> IO.puts(x) end)
IO.inspect(res)

res = Enum.map([1, 2, 3], fn x -> x + 1 end)
IO.inspect(res)

res = Enum.map([1, 2, 3], &(&1 + 1))
IO.inspect(res)

res = Enum.filter(1..10, &(rem(&1, 2) == 1))
IO.inspect(res)

res = Enum.reduce(1..10, 0, fn x, acc -> acc + x end)
IO.inspect(res)

res = Enum.reduce(1..10, 0, &(&1 + &2))
IO.inspect(res)
