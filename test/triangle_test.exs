defmodule TrianglecTest do
  use ExUnit.Case
  doctest Triangle

  test "equilateral triangles have equal sides" do
    assert Triangle.kind(2, 2, 2) == {:ok, :equilateral}
  end

  test "larger equilateral triangles also have equal sides" do
    assert Triangle.kind(10, 10, 10) == {:ok, :equilateral}
  end

  test "equilateral triangles can have float sides" do
    assert Triangle.kind(0.5, 0.5, 0.5) == {:ok, :equilateral}
  end

  test "isosceles triangles have last two sides equal" do
    assert Triangle.kind(3, 4, 4) == {:ok, :isosceles}
  end

  test "isosceles triangles have first and last sides equal" do
    assert Triangle.kind(4, 3, 4) == {:ok, :isosceles}
  end

  test "isosceles triangles have two first sides equal" do
    assert Triangle.kind(4, 4, 3) == {:ok, :isosceles}
  end

  test "isosceles triangles have in fact exactly two sides equal" do
    assert Triangle.kind(10, 10, 2) == {:ok, :isosceles}
  end

  test "isosceles triangles can have float sides" do
    assert Triangle.kind(0.5, 0.4, 0.5) == {:ok, :isosceles}
  end

  test "scalene triangles have no equal sides" do
    assert Triangle.kind(3, 4, 5) == {:ok, :scalene}
  end

  test "scalene triangles have no equal sides at a larger scale too" do
    assert Triangle.kind(10, 11, 12) == {:ok, :scalene}
  end

  test "scalene triangles have no equal sides in descending order either" do
    assert Triangle.kind(5, 4, 2) == {:ok, :scalene}
  end

  test "scalene triangles can have float sides" do
    assert Triangle.kind(0.4, 0.6, 0.3) == {:ok, :scalene}
  end

  test "triangles with no size are illegal" do
    assert Triangle.kind(0, 0, 0) == {:error, "all side lengths must be positive"}
  end

  test "triangles with negative sides are illegal" do
    assert Triangle.kind(3, 4, -5) == {:error, "all side lengths must be positive"}
  end

  test "first triangle inequality violation" do
    assert Triangle.kind(1, 1, 3) == {:error, "side lengths violate triangle inequality"}
  end

  test "second triangle inequality violation" do
    assert Triangle.kind(1, 3, 1) == {:error, "side lengths violate triangle inequality"}
  end

  test "third triangle inequality violation" do
    assert Triangle.kind(3, 1, 1) == {:error, "side lengths violate triangle inequality"}
  end

  test "another triangle inequality violation" do
    assert Triangle.kind(7, 3, 2) == {:error, "side lengths violate triangle inequality"}
  end
end
