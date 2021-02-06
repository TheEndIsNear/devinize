# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :devinize, DevinizeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nePp62OrXqu6dmMW0EY0H+jNMRcPoYzgzRrve2EKh2DHBePK+97JW5PoZ03vNv5/",
  render_errors: [view: DevinizeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Devinize.PubSub,
  live_view: [signing_salt: "0KSiWLEs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
