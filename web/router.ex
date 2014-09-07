defmodule InfoParsePhoenix.Router do
  use Phoenix.Router

  # get "/", InfoParsePhoenix.PageController, :index, as: :pages
  get "/", InfoParsePhoenix.PageController, :index
  get "/directory", InfoParsePhoenix.PageController, :directory

end
