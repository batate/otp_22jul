defmodule Overlord do
  alias Overlord.Server

  def start_link(answer) do
      GenServer.start_link(Server, answer, name: :overlord)
  end

  def guess(guess) do
    GenServer.call(:overlord, {:guess, guess})
  end
end
