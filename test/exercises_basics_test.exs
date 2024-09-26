defmodule ExercisesBasicTest do
  use ExUnit.Case
  alias ExercisesBasic, as: M
  doctest ExercisesBasic

  test "x and y sum" do
    assert M.sum() == 30
  end

  test "length of list" do
    assert M.list_len([1, 2, 3, 4, 5]) == 5
  end

  test "returns 'Hello World'" do
    assert M.hello() == "Hello World"
  end

  test "get second element of tuple" do
    assert M.snd() == 20
  end

  test "if x is greater than 10, display 'large', otherwise display 'small'" do
    assert M.condition() == "Large"
  end

  test "double elements of list" do
    assert M.double() == [2, 4, 6, 8, 10]
  end

  test "multiply: It takes two arguments, calculates the product of those arguments, and returns the result." do
    assert M.multiply(2, 3) == 6
    assert M.multiply(5, 8) == 40
  end

  test "Recursively calculate the length of list" do
    assert M.list_length([1, 2, 3]) == 3
    assert M.list_length([1, 2, 3, 4, 5]) == 5
    assert M.list_length([1]) == 1
    assert M.list_length([]) == 0
  end

  test "If the integer passed as an argument is positive, it returns “positive”, if it is negative, it returns “negative”, and if it is zero, it returns “zero”." do
    assert M.check_sign(0) == "zero"
    assert M.check_sign(1) == "positive"
    assert M.check_sign(-1) == "negative"
  end

  test "Returns the nth value of the Fibonacci sequence for the number n passed" do
    assert M.fib_n(0) == 0
    assert M.fib_n(1) == 1
    assert M.fib_n(5) == 5
    assert M.fib_n(10) == 55
  end

  test "Retrieve the value of the key:age from the keyword list [name: “John”, age: 30, city: “New York”]" do
    assert M.pick_key() == 30
  end

  test "anonymous function" do
    assert M.anon_fn() == 8
  end

  test "Get value from map" do
    assert M.get_value_from_map() == "Alice"
  end

  test "Recursively add up all the elements in the list" do
    assert M.sum_list([1, 2, 3, 4, 5]) == 15
    assert M.sum_list([5]) == 5
    assert M.sum_list([]) == 0
  end

  test "sum of 1st and 3rd elements of tuple" do
    assert M.sum_tuple() == 400
  end

  test "Take only even numbers from the list" do
    assert M.even() == [2, 4, 6, 8, 10]
  end

  test "Find the minimum value from the list" do
    assert M.min() == 1
  end

  test "not divisible by 4 is common year" do
    # expects nil or false
    refute M.leap_year?(2015)
  end

  test "year divisible by 2, not divisible by 4 is common year" do
    refute M.leap_year?(1970)
  end

  test "year divisible by 4, not divisible by 100 is a leap year" do
    assert M.leap_year?(1996)
  end

  test "year divisible 4 and 5 is a leap year" do
    assert M.leap_year?(1960)
  end

  test "year divisible by 100, not divisible by 400 is common year" do
    refute M.leap_year?(2100)
  end

  test "year divisible by 100 but not by 3 is common year" do
    refute M.leap_year?(1900)
  end

  test "year divisible by 400 is a leap year" do
    assert M.leap_year?(2000)
  end

  test "year divisible by 400 but not by 125 is a leap year" do
    assert M.leap_year?(2400)
  end

  test "year divisible by 200, not by 400 is common year" do
    refute M.leap_year?(1800)
  end

  test "returns black color code" do
    assert M.code(:black) == 0
  end

  test "returns brown color code" do
    assert M.code(:brown) == 1
  end

  test "returns red color code" do
    assert M.code(:red) == 2
  end

  test "returns orange color code" do
    assert M.code(:orange) == 3
  end

  test "returns yellow color code" do
    assert M.code(:yellow) == 4
  end

  test "returns green color code" do
    assert M.code(:green) == 5
  end

  test "returns blue color code" do
    assert M.code(:blue) == 6
  end

  test "returns violet color code" do
    assert M.code(:violet) == 7
  end

  test "returns grey color code" do
    assert M.code(:grey) == 8
  end

  test "returns white color code" do
    assert M.code(:white) == 9
  end
end
