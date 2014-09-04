use Mix.Config

config :phoenix, InfoParsePhoenix.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_info_parse_phoenix_key",
  session_secret: "#Z1Z0G3S5(MS1&=38B8$9IFKX8H+J824JC*CT0D7!2VSWSF0YC%L^8$1UWW0LNWG5)#NKU&+1D&QN!N",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


