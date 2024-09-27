defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as length
  """
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0,
    do: {:error, "all side lengths must be positive"}

  def kind(a, b, c) when a + b < c or b + c < a or c + a < b do
    {:error, "side lengths violate triangle inequality"}
  end

  def kind(a, b, c) when a == b and b == c, do: {:ok, :equilateral}
  def kind(a, b, c) when a == b or b == c or c == a, do: {:ok, :isosceles}
  def kind(_, _, _), do: {:ok, :scalene}
end
