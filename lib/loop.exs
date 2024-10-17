defmodule SimpleListHelper do
  @doc """
  Iterating with recursion
  """
  def sum([]), do: 0

  def sum([head | tail]) do
    head + sum(tail)
  end
end

defmodule ListHelper do
  @moduledoc """
  Iterating with tail-call recursion
  """

  def sum(list) do
    sum_aux(0, list)
  end

  defp sum_aux(acc, []) do
    acc
  end

  defp sum_aux(acc, [head | tail]) do
    # call itself at the end
    sum_aux(acc + head, tail)
  end
end

# Comprehensions

doubled = for x <- [1, 2, 3], do: x * x
IO.inspect(doubled)

matrix = for x <- [1,2,3], y <- [1,2,3], do: {x, y, x * y}
IO.inspect(matrix)

multiplication_table =
  for x <- 1..9, y <- 1..9, into: %{}, do: {{x,y}, x * y}
IO.inspect(Map.get(multiplication_table, { 7, 6 }))
