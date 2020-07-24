defmodule Overlord.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Overlord.Worker.start_link(arg)
      {Overlord.Server, {nil, :herminio}},
      {Overlord.Server, {nil, :chris}},
      {Overlord.Server, {nil, :patrick}},
      {Overlord.Server, {nil, :bruce}},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Overlord.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
