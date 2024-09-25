defmodule SimpleCache do
  def put(cache, key, value) do
    Map.put(cache, key, value)
  end

  def get(cache, key) do
    Map.get(cache, key)
  end

  def delete(cache, key) do
    Map.delete(cache, key)
  end
end
