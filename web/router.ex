defmodule InfoParsePhoenix.Router do
  use Phoenix.Router

  get "/", InfoParsePhoenix.PageController, :index, as: :pages

end
