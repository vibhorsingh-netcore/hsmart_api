# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hsmart_api,
  ecto_repos: [HsmartApi.Repo]

# Configures the endpoint
config :hsmart_api, HsmartApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "X06Dh1leLrRiuaWsOY7uI3uaZMj3e7TDM31C3KhakrI8L1DQFs0C5vQn1iIznwJb",
  render_errors: [view: HsmartApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HsmartApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
