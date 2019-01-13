# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :thematics,
  ecto_repos: [Thematics.Repo]

# Configures the endpoint
config :thematics, Thematics.Endpoint,
  url: [ip: {0,0,0,0}, host: "localhost"],
  secret_key_base: "sNDb9oKWAEhj0PQmfm70i4439HTlhKHG+EVB8ABNu8f+X12e9tEX/8eT7ZYLP/FL",
  render_errors: [view: Thematics.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Thematics.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
