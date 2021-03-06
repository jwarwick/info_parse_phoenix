defmodule Mix.Tasks.Db.Import do
  use Mix.Task

  require InfoGather.Repo
  require InfoGather.Repo

  @shortdoc "Import directory info from the infogather database"

  @moduledoc """
  Imports data from the infogather database and populates the tables
  in the infoparse database
  """
  def run(args) do
    Mix.shell.info "Importing data from infogather..."
    Mix.Task.run "app.start", args

    InfoParse.Import.import_data
  end
end

