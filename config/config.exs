# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :realtime_test,
  ecto_repos: [RealtimeTest.Repo]

# Configures the endpoint
config :realtime_test, RealtimeTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "F3Q0qyZG55MryN9DkTUwzCfrMo52l1emUyh2IMnUMoeuY90EYQflNvtqCU1ICjjO",
  render_errors: [view: RealtimeTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RealtimeTest.PubSub,
  live_view: [signing_salt: "ZZUNMbWw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
