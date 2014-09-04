use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, InfoParsePhoenix.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_info_parse_phoenix_key",
  session_secret: "#Z1Z0G3S5(MS1&=38B8$9IFKX8H+J824JC*CT0D7!2VSWSF0YC%L^8$1UWW0LNWG5)#NKU&+1D&QN!N"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

