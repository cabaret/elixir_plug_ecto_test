# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :ecto_test, ecto_repos: [EctoTest.Repo]

config :ecto_test, EctoTest.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "ecto_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "32771"
