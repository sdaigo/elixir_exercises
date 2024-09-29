content = "Now is the time"

lp =
  with {:ok, file} = File.open("/etc/passwd"),
       # inner `content` has no effect to outside `content`
       content = IO.read(file, :eof),
       :ok = File.close(file),
       [_, uid, gid] <- Regex.run(~r/lp:.*?:(\d+):(\d+)/m, content) do
    "Group: #{gid}, User: #{uid}"
  end

IO.puts(lp)
IO.puts(content)

values = [1, 2, 3, 4, 5]

mean =
  with count = Enum.count(values),
       sum = Enum.sum(values),
       do: sum / count

IO.puts(mean)
