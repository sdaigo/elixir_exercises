defmodule FactorialTest do
  use ExUnit.Case

  test "calculates factorial of `n`" do
    assert Factorial.of(5) == 120
  end
end
