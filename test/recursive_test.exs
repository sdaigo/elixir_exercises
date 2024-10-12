defmodule RecursiveTest do
  use ExUnit.Case

  test "Calc sum of 1 to `n`" do
    assert Recursive.sum(5) == 15
    assert Recursive.sum(0) == 0

    assert_raise FunctionClauseError, "no function clause matching in Recursive.sum/1", fn ->
      Recursive.sum(-1) == -1
    end
  end

  test "Find the greatest common divisor of two non-negative integers" do
    assert Recursive.gcd(5, 0) == 5
    assert Recursive.gcd(5, 15) == 5
    assert Recursive.gcd(84, 32) == 4
  end
end
