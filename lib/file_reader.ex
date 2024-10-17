defmodule FileReader do
  @doc """
  takes a file path and returns a list of numbers, with each number representing
  the length of the corresponding line
  """
  def lines_length!(path) do
    path
    |> read!
    |> Enum.map(&String.length/1)
  end

  @doc """
  returns the length of the longest line in afile
  """
  def longest_line_length!(path) do
    path
    |> lines_length!
    |> Enum.max
  end

  @doc """
  returns contents of the longest line in a file
  """
  def longest_line!(path) do
    path
    |> read!
    |> Enum.max_by(&String.length/1)
  end

  @doc """
  returns a list of numbers, with each number representing the word count in a file
  """
  def words_per_line!(path) do
    path
    |> read!
    |> Enum.map(&count/1)
  end

  defp count(string), do: string |> String.split |> length

  defp read!(path) do
    path
    |> File.stream!
    |> Stream.map(&String.trim_trailing(&1, "\n"))
  end
end
