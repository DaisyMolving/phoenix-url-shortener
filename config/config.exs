# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :url_shortener,
  ecto_repos: [UrlShortener.Repo]

# Configures the endpoint
config :url_shortener, UrlShortener.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sfboQ7zmpjrA/h3wNwuj0JPtslMfmu3FGQraxtD+MzpmW6N7l8Q0K/rzPUXWQoU3",
  render_errors: [view: UrlShortener.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UrlShortener.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
