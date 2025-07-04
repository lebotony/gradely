# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :gradely,
  ecto_repos: [Gradely.Repo]

# Configures the endpoint
config :gradely, GradelyWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: GradelyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gradely.PubSub,
  live_view: [signing_salt: "9F5+kHM+"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :gradely, Gradely.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.jsx --bundle --target=es2022 --loader:.js=jsx --outdir=../priv/static/assets --external:/fonts/* --external:/images/* --loader:.svg=dataurl --loader:.png=dataurl --loader:.jpg=dataurl),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :gradely, Gradely.Guardian.Guardian,
  issuer: "gradely",
  secret_key: "LEo1SzKN9iaK8AUM0Uc55y3txdYU1v1aAh/EHA4ErOT3qHhqkLenazKb1HG6b8Xl"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
