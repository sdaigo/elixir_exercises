defmodule Game.Character do
  defstruct name: nil

  defimpl String.Chars do
    def to_string(character), do: character.name
  end
end
