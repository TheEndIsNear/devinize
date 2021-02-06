defmodule Devinize.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DevinizeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Devinize.PubSub},
      # Start the Endpoint (http/https)
      DevinizeWeb.Endpoint
      # Start a worker by calling: Devinize.Worker.start_link(arg)
      # {Devinize.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Devinize.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DevinizeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
