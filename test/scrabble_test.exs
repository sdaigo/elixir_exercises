defmodule ScrabbleTest do
  use ExUnit.Case

  test "`cabbage` is worth 14 points" do
    assert Scrabble.score("cabbage") == 14
  end

  test "whitespace scores zero" do
    assert Scrabble.score(" \t\n") == 0
  end

  test "empty word scores zero" do
    assert Scrabble.score("") == 0
  end
end
