sum = fn a, b -> a + b end
IO.puts(sum.(1, 2))

greet = fn -> IO.puts("hello") end
# need `.()`
greet.()

swap = fn {a, b} -> {b, a} end
IO.inspect(swap.({1, 2}))

list_concat = fn lst1, lst2 -> lst1 ++ lst2 end

IO.inspect(list_concat.([:a, :b], [:c, :d]))

sum = fn a, b, c -> a + b + c end

IO.inspect(sum.(1, 2, 3))

pair_tuple_to_list = fn {a, b} -> [a, b] end

IO.inspect(pair_tuple_to_list.({1, 2}))

fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

IO.puts(fizzbuzz.(0, 0, 1))
IO.puts(fizzbuzz.(0, 1, 1))
IO.puts(fizzbuzz.(1, 0, 1))
IO.puts(fizzbuzz.(1, 1, 1))

fizzbuzz2 = fn n ->
  fizzbuzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts(fizzbuzz2.(10))
IO.puts(fizzbuzz2.(11))
IO.puts(fizzbuzz2.(12))
IO.puts(fizzbuzz2.(13))
IO.puts(fizzbuzz2.(14))
IO.puts(fizzbuzz2.(15))
IO.puts(fizzbuzz2.(16))

prefix = fn str1 -> fn str2 -> "#{str1} #{str2}" end end

mrs = prefix.("Mrs")
IO.puts(mrs.("Smith"))

IO.puts(prefix.("Elixir").("Rocks"))

times_2 = fn n -> n * 2 end
apply = fn f, value -> f.(value) end

IO.puts(apply.(times_2, 6))

res1 = Enum.map([1, 2, 3, 4], &(&1 + 2))
IO.inspect(res1)

Enum.each([1, 2, 3, 4], &IO.inspect(&1))
