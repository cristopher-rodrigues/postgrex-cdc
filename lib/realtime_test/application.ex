defmodule RealtimeTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RealtimeTest.Repo,
      # Start the Telemetry supervisor
      RealtimeTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RealtimeTest.PubSub},
      # Start the Endpoint (http/https)
      RealtimeTestWeb.Endpoint,
      # Start a worker by calling: RealtimeTest.Worker.start_link(arg)
      # {RealtimeTest.Worker, arg}
      {
        Cainophile.Adapters.Postgres,
        register: Cainophile.AppPublisher, # name this process will be registered globally as, for usage with Cainophile.Adapters.Postgres.subscribe/2
        epgsql: %{ # All epgsql options are supported here
          host: 'localhost',
          username: "user",
          database: "app_dev",
          password: "password"
        },
        slot: "app", # :temporary is also supported if you don't want Postgres keeping track of what you've acknowledged
        wal_position: {"0", "0"}, # You can provide a different WAL position if desired, or default to allowing Postgres to send you what it thinks you need
        publications: ["app_publication"]
      },
      RealtimeTest.Pokemons.Subscriber
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RealtimeTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RealtimeTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
