defmodule GameTest do
  use ExUnit.Case

  import Overlord.Game

  # no red in score

  # some reds in score

  # all reds in score

  # a won game

  test "making various moves" do
    game()
    |> assert_key(:status, :playing)
    |> assert_key(:moves, [])
    |> guess([5,6,7,8])
    |> assert_key(:status, :playing)
    |> assert_score(%{reds: 0, whites: 0})
    |> guess([1,2,6,6])
    |> assert_score(%{reds: 2, whites: 0})
    |> guess([1,2,3,4])
    |> assert_score(%{reds: 4, whites: 0})
    |> assert_key(:status, :won)
  end

  defp assert_score(game, expected_score) do
    actual_score =
      game
      |> info()
      |> Map.get(:moves)
      |> hd()
      |> Map.get(:score)

    assert actual_score.reds == expected_score.reds
    assert actual_score.whites == expected_score.whites

    game
  end

  defp assert_key(game, key, actual) do
    expected =
      game
      |> info()
      |> Map.get(key)

    assert actual == expected
    game
  end

  def game do
    new([1,2,3,4])
  end



  # finish game

  # playing game

  # won game

  # lost game

  # making a move adds a move



  # no whites in score

  # some whites in score

  # all whites in score

end
