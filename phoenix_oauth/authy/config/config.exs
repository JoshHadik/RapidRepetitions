# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :authy,
  ecto_repos: [Authy.Repo]

# Configures the endpoint
config :authy, AuthyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EYzR1WdtmGlVdQ65E3ldOHP9OBi2scpuVn5sXm5d8uat5s3fOIDxyWC5w+hbbBWq",
  render_errors: [view: AuthyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Authy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configure Ueberauth
config :ueberauth, Ueberauth, providers: [
  github: {
    Ueberauth.Strategy.Github,
    default_scope: "user,user:email"
  },
  facebook: {
    Ueberauth.Strategy.Facebook,
    default_scope: "email"
  },
  google: {
    Ueberauth.Strategy.Google,
    default_scope: "email"
  },
  twitter: {
    Ueberauth.Strategy.Twitter,
    default_scope: "email"
  }
]

# Configure Ueberauth Github
config :ueberauth, Ueberauth.Strategy.Github.OAuth,
client_id: System.get_env("GITHUB_CLIENT_ID"),
client_secret: System.get_env("GITHUB_SECRET_KEY")

# Configure Ueberauth Facebook
config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
client_id: System.get_env("FACEBOOK_CLIENT_ID"),
client_secret: System.get_env("FACEBOOK_SECRET_KEY")

# Configure Ueberauth Google
config :ueberauth, Ueberauth.Strategy.Google.OAuth,
client_id: System.get_env("GOOGLE_CLIENT_ID"),
client_secret: System.get_env("GOOGLE_SECRET_KEY")

# Configure Ueberauth Twitter
config :ueberauth, Ueberauth.Strategy.Twitter.OAuth,
consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
