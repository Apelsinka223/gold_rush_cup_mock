# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :gold_rush_cup_mock, GoldRushCupMockWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FVHWaFxadpz+lyf1HWOTkl5doW8qLLEQm2KV6j2m6XHDPJH2AxA0IcF/Fi9PrdgG",
  render_errors: [view: GoldRushCupMockWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GoldRushCupMock.PubSub,
  live_view: [signing_salt: "ZQRrSsSz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
