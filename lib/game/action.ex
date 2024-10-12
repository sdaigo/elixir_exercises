defmodule Game.Action do
  defstruct label: nil

  defimpl String.Chars do
    def to_string(action), do: action.label
  end
end
