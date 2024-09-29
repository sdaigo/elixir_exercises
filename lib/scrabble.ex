defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  def score(word) do
    word
    |> String.upcase()
    |> String.split("")
    |> Enum.map(&calc_score/1)
    |> Enum.sum()
  end

  defp calc_score(c) when c in ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], do: 1
  defp calc_score(c) when c in ["D", "G"], do: 2
  defp calc_score(c) when c in ["B", "C", "M", "P"], do: 3
  defp calc_score(c) when c in ["F", "H", "V", "W", "Y"], do: 4
  defp calc_score(c) when c in ["K"], do: 5
  defp calc_score(c) when c in ["J", "X"], do: 8
  defp calc_score(c) when c in ["Q", "Z"], do: 10
  defp calc_score(_), do: 0
end
