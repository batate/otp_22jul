defmodule Increasly.Server do
  use GenServer
  alias Increasly.Core

  def start_link(num) do
    GenServer.start_link(__MODULE__, num, name: :server)
  end

  # Callbacks

  def init(count) do
    {:ok, Core.counter(count)}
  end

  def handle_call(:state, _from, count) do
    {:reply, count, count}
  end

  def handle_cast(:inc, count) do
    {:noreply, Core.up(count)}
  end

  def handle_cast(:dec, count) do
    {:noreply, Core.down(count)}
  end
end
