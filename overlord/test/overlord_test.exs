defmodule OverlordTest do
  use ExUnit.Case
  doctest Overlord

  test "greets the world" do
    assert Overlord.hello() == :world
  end
end
