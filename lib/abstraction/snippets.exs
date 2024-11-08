days =
  MapSet.new()
  |> MapSet.put(:monday)
  |> MapSet.put(:tuesday)

IO.puts(MapSet.member?(days, :monday))
