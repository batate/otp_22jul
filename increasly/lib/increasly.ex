defmodule Increasly do
  # alias Increasly.Boundary
  alias Increasly.Server

  def start_link(num) do
    {:ok, counter} = GenServer.start_link(Server, num, name: :server)
    counter
  end

  def inc do
    GenServer.cast(:server, :inc)
  end

  def dec do
    GenServer.cast(:server, :dec)
  end

  def state do
    GenServer.call(:server, :state)
  end
end
