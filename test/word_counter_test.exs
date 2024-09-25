defmodule WordCounterTest do
  use ExUnit.Case
  alias WordCounter, as: WC
  doctest WordCounter

  test "count_words/1 counts words correctly" do
    assert WC.count_words("hello world hello") == %{"hello" => 2, "world" => 1}
    assert WC.count_words("hello, world hello") == %{"hello" => 2, "world" => 1}

    assert WC.count_words("Hello, hello, hello, how low?") == %{
             "hello" => 3,
             "how" => 1,
             "low" => 1
           }
  end
end
