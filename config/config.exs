# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :early_bird,
  ecto_repos: [EarlyBird.Repo]

# Configures the endpoint
config :early_bird, EarlyBird.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QTtBevcegIJmS44H6EI+ydfbevFQfMvnS4drgSfLLYVJLHF12WK0R1opfMokMPNd",
  render_errors: [view: EarlyBird.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EarlyBird.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
