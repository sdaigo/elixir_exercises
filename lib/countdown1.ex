defmodule Countdown do
  def sleep(seconds) do
    receive do
      after seconds * 1000 -> nil
    end
  end

  def say(text) do
    spawn(fn -> :os.cmd("say #{text}" |> to_charlist) end)
  end

  @spec timer() :: ({:cont, any()} | {:halt, any()} | {:suspend, any()}, any() ->
                      {:halted, any()} | {:suspended, any(), (any() -> any())})
  def timer do
    Stream.resource(
      fn ->
        {_h, _m, s } = :erlang.time
        60 - s - 1
      end,
      fn
        0 ->
          {:halt, 0}
        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,
      fn _ -> nil end
    )
  end
end
