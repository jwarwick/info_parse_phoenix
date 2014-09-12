defmodule InfoParsePhoenix.StudentController do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, "index", title: "Student List"
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
