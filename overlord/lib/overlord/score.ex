defmodule Overlord.Score do
  @number_of_slots 4

  def new(answer, guess) do
    %{
      reds: reds(answer, guess),
      whites: whites(answer, guess)
    }
  end

  defp reds(answer, guess) do
    answer
    |> Enum.zip(guess)
    |> Enum.filter(fn {a, g} -> a == g end)
    |> length
  end

  defp whites(answer, guess) do
   # number_of_slots = length(answer)
    number_of_reds = reds(answer, guess)
    number_of_misses = misses(answer, guess)

    @number_of_slots - number_of_reds - number_of_misses
  end

  defp misses(answer, guess) do
    guess -- answer
    |> length
  end
end
