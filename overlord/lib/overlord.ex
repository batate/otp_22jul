defmodule Overlord do
  alias Overlord.Server

  def start_link({answer, player}) do
      GenServer.start_link(Server, answer, name: player)
  end

  def guess(guess, player) do
    GenServer.call(player, {:guess, guess})
  end
end
