defmodule Overlord.Game do
  alias Overlord.Score

  defstruct [
    :answer,
    guesses: [],
  ]

  def new(answer \\ random_answer()) do
    %__MODULE__{answer: answer}
  end

  def guess(%__MODULE__{} = game, guess) do
    %{game | guesses: [guess | game.guesses]}
  end

  defp random_answer() do
    (1..8)
    |> Enum.shuffle()
    |> Enum.take(4)
  end

  def info(%__MODULE__{} = game) do
    moves =
      game.guesses
      |> Enum.map(&row(game, &1))

    %{moves: moves, status: status(game)}
  end

  defp row(game, guess) do
    %{
      guess: guess,
      score: Score.new(game.answer, guess),
    }
  end

  defp status(game) do
    won(game) || lost(game) || :playing
  end

  defp won(%{answer: answer, guesses: [answer | _]} = game) do
    :won
  end

  defp won(_game), do: nil

  defp lost(game) do
    result =
      game.guesses
      |> length()
      |> Kernel.==(10)

    if result, do: :lost
  end
end
