person = {"Bob", 25}

# matching tuples
{ name, age } = person

IO.puts("#{name}, #{age}")

{ date, time } = :calendar.local_time()
{ year, month, day } = date
{ hour, minute, second } = time

IO.puts("#{year}/#{month}/#{day} #{hour}:#{minute}:#{second}")

# Matching constants
# first element is a constant atom, to denote that this tuple represents a person
person2 = {:person, "Bob", 25}

{:person, _ , _} = person2

IO.puts(:person)

{:ok, contents} = File.read("lib/pattern_match.exs")

IO.puts(:ok)
IO.puts(contents)

{ _, {hour, _, _} } = :calendar.local_time()
IO.puts(hour)

{n, n, n} = {255, 255, 255}
IO.puts(n)

expected_name = "Bob"

{^expected_name, _} = person

# Error
# {^expected_name, _} = {"Alice", 30}

# Matching list
[first, second, third] = [1, 2, 3]

IO.puts("#{first} - #{second} - #{third}")

[head | tail] = [1, 2, 3]
IO.puts(head) # 1
IO.inspect(tail) # [2, 3]

[min | _] = Enum.sort([3, 2, 1])
IO.puts(min)

# Matching maps
%{name: name, age: age} = %{name: "Bob", age: 25}

IO.puts("#{name}, #{age}")

%{age: age} = %{name: "Bob", age: 25}

IO.puts(age)

# Matching binary
binary = <<1,2,3>>
<<b1, b2, b3>> = binary

IO.puts(b1) # 1

<<b1, rest :: binary>> = binary
IO.puts(b1)
IO.inspect(rest)

# splits byte into 2 4bit values
# 155 => 10011011
# -> 1001 | 1011
# -> 9 | 11
<<a :: 4, b :: 4>> = << 155 >>

command = "ping www.example.com"

"ping " <> url = command

IO.puts(url)

## Multiclause functions
rect = {:rect, 4, 5}
square = {:square, 5}
circle = {:circle, 4}

defmodule Geometry do
  def area({:rect, w, h}) do
    w * h
  end

  def area({:square, a}) do
    a * a
  end

  def area({:circle, r}) do
    3.14 * r * r
  end

  def area(unknown), do: {:error, {:unknown_shape, unknown}}
end

IO.puts(Geometry.area(rect))
IO.puts(Geometry.area(square))
IO.puts(Geometry.area(circle))
IO.inspect(Geometry.area({:triangle, 1, 2, 3}))

test_num = fn
  x when is_number(x) and x < 0 -> :negative
  x when x == 0 -> :zero
  x when is_number(x) and x > 0 -> :positive
end

IO.puts(test_num.(-1))
IO.puts(test_num.(0))
IO.puts(test_num.(1))

# Classical branching expression
max = fn (a, b) ->
  if a >= b, do: a, else: b
end

call_status = fn call ->
  cond do
    call.ended_at != nil -> :ended
    call.started_at != nil -> :started
    true -> :pending
  end
end

IO.puts(call_status.(%{ started_at: :now, ended_at: nil }))
IO.puts(call_status.(%{ started_at: :nil, ended_at: :now }))
IO.puts(call_status.(%{ started_at: :nil, ended_at: :nil }))

max = fn (a, b) ->
  case a >= b do
    true -> a
    _ -> b
  end
end

IO.puts(max.(10, 5))

# `with` expression
input = %{
  "login" => "alice",
  "email" => "some_email",
  "password" => "password",
  "other_field" => "some_value",
  "yet_another_field" => "...",
}

# normalize map
defmodule NormalizeUser do
  defp extract_login(%{"login" => login}), do: {:ok, login}
  defp extract_login(_), do: {:error, "login missing"}

  defp extract_email(%{"email" => email}), do: {:ok, email}
  defp extract_email(_), do: {:error, "email missing"}

  defp extract_password(%{"password" => password}), do: {:ok, password}
  defp extract_password(_), do: {:error, "password missing"}

  def extract_user user do
    with {:ok, login} <- extract_login(user),
        {:ok, email} <- extract_email(user),
        {:ok, password} <- extract_password(user) do
      {:ok, %{login: login, email: email, password: password}}
    end
  end
end

IO.inspect(NormalizeUser.extract_user(%{}))
IO.inspect(NormalizeUser.extract_user(%{"login" => "some_login"}))
IO.inspect(NormalizeUser.extract_user(%{"login" => "some_login", "email" => "some_email"}))
IO.inspect(NormalizeUser.extract_user(%{"login" => "some_login", "email" => "some_email", "password" => "some_password"}))
