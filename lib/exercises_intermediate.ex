defmodule ExercisesIntermediate do
  @doc """
  merge two list [a: 1, b: 2], [b: 3, c: 4]
  """
  def merge_keyword_list() do
    lst1 = [a: 1, b: 2]
    lst2 = [b: 3, c: 4]

    Keyword.merge(lst1, lst2)
  end

  def check_city(m) do
    Map.has_key?(m, :city)
  end

  def unique(lst) do
    # Enum.uniq(lst)
    unique_aux(lst, [])
  end

  defp unique_aux([], acc), do: Enum.reverse(acc)

  defp unique_aux([hd | tl], acc) do
    if hd in acc do
      unique_aux(tl, acc)
    else
      unique_aux(tl, [hd | acc])
    end
  end

  def reverse([]), do: []

  def reverse([hd | tl]) do
    reverse(tl) ++ [hd]
  end

  def max([]), do: nil
  def max([n]), do: n

  def max([hd | tl]) do
    max_tail = max(tl)

    if hd > max_tail do
      hd
    else
      max_tail
    end
  end

  def factorial(0), do: 1

  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  def sum_list([]), do: 0

  def sum_list([hd | tl]) do
    hd + sum_list(tl)
  end

  def multiply_list([]), do: 1

  def multiply_list([hd | tl]) do
    hd * multiply_list(tl)
  end
end
