defmodule Overlord.Server do
  use GenServer
  alias Overlord.Game

  def init(answer), do: {:ok, Game.new(answer) }

  def start_link({answer, player}), do: GenServer.start_link(__MODULE__, answer, name: player)

  def handle_call({:guess, guess}, _from, game) do
    new_game = Game.guess(game, guess)
    {:reply, Game.info(new_game), new_game}
  end

  def child_spec({answer, player}) do
    %{id: player, start: {__MODULE__, :start_link, [{answer, player}]}}
  end
end
