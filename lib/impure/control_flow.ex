defmodule Impure.Shop.ControlFlow do
  @doc"""
  iex> c("lib/impure/control_flow.ex")
  iex> Impure.Shop.ControlFlow.checkout(10)
  Quantity?
  three

  It's not a number
  :ok
  """
  def checkout(price) do
    case ask_number("Quantity?")  do
      :error -> IO.puts("It's not a number")
      {quantity, _} -> quantity * price
    end
  end

  defp ask_number(message) do
    message <> "\n"
    |> IO.gets
    |> Integer.parse
  end
end
