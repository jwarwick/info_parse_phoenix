defmodule InfoParsePhoenix.Mixfile do
  use Mix.Project

  def project do
    [ app: :info_parse_phoenix,
      version: "0.0.1",
      elixir: "~> 1.0.0-rc1",
      elixirc_paths: ["lib", "web"],
      aliases: aliases,
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { InfoParsePhoenix, [] },
      applications: [:phoenix, :cowboy, :logger, :postgrex, :ecto]
    ]
  end

  defp aliases do
    [
      server: "phoenix.start",
      import: ["ecto.drop InfoParse.Repo", "ecto.create InfoParse.Repo",
        "ecto.migrate InfoParse.Repo", "db.import"]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:phoenix, "0.4.0"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 0.2.0"}
    ]
  end
end
