defmodule InfoParsePhoenix do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      worker(InfoGather.Repo, []),
      worker(InfoParse.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: InfoParsePhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
