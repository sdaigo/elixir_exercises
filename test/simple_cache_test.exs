defmodule SimpleCacheTest do
  use ExUnit.Case
  import SimpleCache
  doctest SimpleCache

  setup do
    %{cache: %{}}
  end

  test "put and get values from the cache", %{cache: cache} do
    cache = put(cache, :key1, "value1")
    assert get(cache, :key1) == "value1"
  end

  test "return nil if key does not exist", %{cache: cache} do
    assert get(cache, :no_existent_key) == nil
  end

  test "delete a key from the cache", %{cache: cache} do
    cache = put(cache, :key1, "value2")
    cache = delete(cache, :key2)
    assert get(cache, :key2) == nil
  end
end
