defmodule ExercisesBasic do
  def sum do
    x = 10
    y = 20
    x + y
  end

  def list_len(lst) do
    Enum.count(lst)
  end

  def hello do
    "Hello" <> " " <> "World"
  end

  def snd do
    elem({10, 20, 30}, 1)
  end

  def condition do
    x = 15

    if x > 10 do
      "Large"
    else
      "Small"
    end
  end

  def double() do
    # Enum.map([1, 2, 3, 4, 5], fn x -> x * 2 end)
    Enum.map([1, 2, 3, 4, 5], &(&1 * 2))
  end

  def multiply(x, y) do
    x * y
  end

  @doc """
  Recursively calculate the length of a list
  """
  def list_length([]), do: 0

  def list_length([_ | tl]) do
    1 + list_length(tl)
  end

  @doc """
  If the integer passed as an argument is positive, it returns “positive”, if it is negative, it returns “negative”, and if it is zero, it returns “zero”.
  """
  def check_sign(n) when n > 0, do: "positive"
  def check_sign(n) when n < 0, do: "negative"
  def check_sign(n) when n == 0, do: "zero"

  @doc """
  Returns the nth value of the Fibonacci sequence for the number n passed
  """
  def fib_n(0), do: 0
  def fib_n(1), do: 1

  def fib_n(n) when n > 1 do
    fib_n(n - 1) + fib_n(n - 2)
  end

  @doc """
  Retrieve the value of the key:age from the keyword list [name: “John”, age: 30, city: “New York”]
  """
  def pick_key() do
    person = [name: "John", age: 30, city: "New"]
    Keyword.get(person, :age)
  end

  @doc """
  Define an anonymous function that takes two arguments,
  calculates the sum of those arguments,
  and returns the result. Use that function to calculate the sum of 3 and 5.
  """
  def anon_fn() do
    f = fn x, y -> x + y end
    f.(3, 5)
  end

  def get_value_from_map() do
    m = %{name: "Alice", age: 25, city: "London"}
    Map.get(m, :name)
  end

  @doc """
  Recursively add up all the elements in the list
  """
  def sum_list([]), do: 0
  def sum_list([hd | tl]), do: hd + sum_list(tl)

  @doc """
  Take the first and third elements from the tuple {100, 200, 300} and find their sum.
  """
  def sum_tuple() do
    {a, _, c} = {100, 200, 300}
    a + c
  end

  @doc """
  Take only even numbers from the list
  """
  def even() do
    Enum.filter(1..10, fn x -> rem(x, 2) == 0 end)
  end

  @doc """
  Find the minimum value from the list
  """
  def min() do
    Enum.min([4, 7, 1, 9, 2])
  end

  @doc """
  Detect the year is leap year
  """
  def leap_year?(year) when rem(year, 400) == 0, do: true
  def leap_year?(year) when rem(year, 100) == 0, do: false
  def leap_year?(year) when rem(year, 4) == 0, do: true
  def leap_year?(_year), do: false

  @doc """
  Return the value of a color band
  """
  def code(color) do
    case color do
      :black -> 0
      :brown -> 1
      :red -> 2
      :orange -> 3
      :yellow -> 4
      :green -> 5
      :blue -> 6
      :violet -> 7
      :grey -> 8
      :white -> 9
    end
  end
end
