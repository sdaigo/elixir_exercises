defmodule WordCounter do
  @doc """
  Takes a text and returns the number of occurrences of each word as a map
  """
  def count_words(text) do
    text
    |> String.downcase()
    |> String.replace(~r/[!?.,]/, "")
    |> String.split(~r/[\s,.]+/)
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
