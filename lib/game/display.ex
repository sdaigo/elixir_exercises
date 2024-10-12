defprotocol Game.Display do
  def info(value)
end

defimpl Game.Display, for: Game.Action do
  def info(action), do: "Action: #{action.label}"
end

defimpl Game.Display, for: Game.Character do
  def info(character), do: "Character: #{character.name}"
end
