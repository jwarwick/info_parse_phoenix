defmodule InfoParsePhoenix.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, "index", title: "Main Page"
  end

  def directory(conn, _params) do
    render conn, "directory", title: "Student Directory", classrooms: InfoParse.Directory.ordered_classrooms
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
