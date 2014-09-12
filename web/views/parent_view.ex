defmodule InfoParsePhoenix.ParentView do
  use InfoParsePhoenix.Views

  def parent_count, do: InfoParse.Directory.ordered_parents |> Enum.count

  def all_parents do
    InfoParse.Directory.ordered_parents
    |> Enum.map(&({&1, InfoParse.Directory.get_parent(&1)}))
  end
end
