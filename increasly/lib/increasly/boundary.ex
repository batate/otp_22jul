defmodule Increasly.Boundary do
  alias Increasly.Core

  def start(init) do
    spawn(fn ->
      Core.counter(init) |> run
    end)
  end

  def run(count) do
    count
    |> listen
    |> run
  end

  def listen(count) do
    receive do
      :inc ->
        Core.up(count)
      :dec ->
        Core.down(count)
      {:state, from} ->
        send(from, count)
        count
    end
  end
end
