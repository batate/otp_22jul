defmodule Increasly do
  alias Increasly.Boundary

  def start(num) do
    Boundary.start(num)
  end

  def inc(pid) do
    send(pid, :inc)
  end

  def dec(pid) do
    send(pid, :dec)
  end

  def state(pid) do
    send(pid, {:state, self()})

    receive do
      count -> count        # code
    end
  end
end
