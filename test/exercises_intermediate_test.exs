defmodule ExercisesIntermediateTest do
  use ExUnit.Case
  alias ExercisesIntermediate, as: M
  doctest ExercisesIntermediate

  test "merge_keyword_list" do
    assert M.merge_keyword_list() == [a: 1, b: 3, c: 4]
  end

  test "check the map has key `:city`" do
    assert M.check_city(%{name: "Alice", age: 25}) == false
    assert M.check_city(%{name: "Alice", city: "rabbithole"}) == true
  end

  test "omit duplicate elements" do
    assert M.unique([1, 2, 2, 3, 4, 4, 5]) == [1, 2, 3, 4, 5]
    assert M.unique([]) == []
  end

  test "reverse list" do
    assert M.reverse([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]
    assert M.reverse([]) == []
  end

  test "find maximum number from list" do
    assert M.max([1, 2, 3, 1, 2]) == 3
    assert M.max([1, 2, 3, 1, 3, 2]) == 3
    assert M.max([]) == nil
  end

  test "factorial" do
    assert M.factorial(5) == 5 * 4 * 3 * 2 * 1
    assert M.factorial(0) == 1
  end

  test "sum of elements of list" do
    assert M.sum_list([1, 2, 3, 4, 5]) == 1 + 2 + 3 + 4 + 5
    assert M.sum_list([0]) == 0
  end

  test "multiply elements of list" do
    assert M.multiply_list([1, 2, 3]) == 1 * 2 * 3
    assert M.multiply_list([0, 1]) == 0
    assert M.multiply_list([0]) == 0
  end
end
