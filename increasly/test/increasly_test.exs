defmodule IncreaslyTest do
  use ExUnit.Case
  doctest Increasly

  test "greets the world" do
    assert Increasly.hello() == :world
  end
end
