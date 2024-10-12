defmodule Recursive do
  @doc """
  calculates sum of 1 to `n`
  """
  def sum(0), do: 0

  def sum(n) when n >= 0 do
    n + sum(n - 1)
  end

  @doc """
  Find the greatest common divisor of two non-negative integers
  """
  def gcd(x, 0), do: x

  def gcd(x, y), do: gcd(y, rem(x, y))
end
