defmodule Overlord.Game do
  # alias Overlord.Score

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

end
