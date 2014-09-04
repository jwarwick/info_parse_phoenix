# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, InfoParsePhoenix.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_info_parse_phoenix_key",
  session_secret: "#Z1Z0G3S5(MS1&=38B8$9IFKX8H+J824JC*CT0D7!2VSWSF0YC%L^8$1UWW0LNWG5)#NKU&+1D&QN!N",
  catch_errors: true,
  debug_errors: false,
  error_controller: InfoParsePhoenix.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
