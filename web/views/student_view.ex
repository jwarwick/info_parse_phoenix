defmodule InfoParsePhoenix.StudentView do
  use InfoParsePhoenix.Views

  def student_count, do: InfoParse.Directory.ordered_students |> Enum.count

  def all_students do
    InfoParse.Directory.ordered_students
    |> Enum.map(&({&1, InfoParse.Directory.get_student(&1)}))
  end

end
