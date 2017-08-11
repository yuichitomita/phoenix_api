# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :matching_app,
  ecto_repos: [MatchingApp.Repo]

# Configures the endpoint
config :matching_app, MatchingApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o5n0bVjv9nX1vvpuBwxN5c5hN+LOzGqe1gPDlCOEvjVwRz9NQSuubsCZkeREf9qw",
  render_errors: [view: MatchingApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MatchingApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
