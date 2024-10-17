employees = ["Alice", "Bob", "John"]

# Enum.with_index/1 goes through the entire list
# Enum.each/1 goes through the entire new list
employees
 |> Enum.with_index(1)
 |> Enum.each(fn {name, index} ->
      IO.puts("#{index}: #{name}")
    end)

# produces the actual result on demand with stream
st = Stream.map([1,2,3], fn x -> 2 * x end)

# stream is lazy enumerable, iteration over the input list and transform haven't yet happend
IO.inspect(st)

# make iteration happen,
IO.inspect(Enum.to_list(st))
IO.inspect(Enum.take(st, 1))

employees
 |> Stream.with_index(1)
 |> Enum.each(fn {name, index} -> IO.puts("#{index}: #{name}") end)

large_lines! = fn path ->
  File.stream!(path)
  |> Stream.map(&String.trim_trailing(&1, "\n"))
  |> Enum.filter(&(String.length(&1) > 80))
end

lines = large_lines!.("./erl_crash.dump")
IO.inspect(lines)

# infinite streams
natural_numbers = Stream.iterate(1, fn prev -> prev + 1 end)

IO.inspect(Enum.take(natural_numbers, 10))

inputs = Stream.repeatedly(fn -> IO.gets("> ") end)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.take_while(&(&1 != ""))

IO.inspect(inputs)
