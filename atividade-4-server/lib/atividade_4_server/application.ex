defmodule Atividade4Server.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Atividade4ServerWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:atividade_4_server, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Atividade4Server.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Atividade4Server.Finch},
      # Start a worker by calling: Atividade4Server.Worker.start_link(arg)
      # {Atividade4Server.Worker, arg},
      # Start to serve requests, typically the last entry
      Atividade4ServerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Atividade4Server.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Atividade4ServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
