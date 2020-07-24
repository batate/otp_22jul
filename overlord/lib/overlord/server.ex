defmodule Overlord.Server do
  use GenServer
  alias Overlord.Game

  def init(answer), do:  {:ok, Game.new(answer)}

  def handle_call({:guess, guess}, _from, game) do
    new_game = Game.guess(game, guess)
    {:reply, Game.info(new_game), new_game}
  end
end
