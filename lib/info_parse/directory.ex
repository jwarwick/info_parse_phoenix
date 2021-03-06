defmodule InfoParse.Directory do
  @moduledoc """
  Functions to display directory information
  """

  import Ecto.Query

  def ordered_classrooms() do
    query = from(c in InfoGather.ClassroomModel, 
                 order_by: [c.grade_level, c.name],
                 select: {c.id, c.name})
    InfoGather.Repo.all(query)
  end

  def ordered_students, do: ordered_students(0)
  def ordered_students(start_student_id) do
    query = from(s in InfoParse.StudentModel,
                 where: s.id >= ^start_student_id,
                 order_by: [s.lastname, s.firstname],
                 select: s.id)
    InfoParse.Repo.all(query)
  end

  def ordered_students(class_id, nil), do: ordered_students(class_id, 0)
  def ordered_students(class_id, start_student_id) do
    query = from(s in InfoParse.StudentModel,
                 where: s.classroom_id == ^class_id,
                 where: s.id >= ^start_student_id,
                 order_by: [s.lastname, s.firstname],
                 select: s.id)
    InfoParse.Repo.all(query)
  end

  def get_student(id) do
    query = from(s in InfoParse.StudentModel,
                 where: s.id == ^id,
                 select: {s.lastname, s.firstname, s.bus_id})
    [{last, first, bus_id}] = InfoParse.Repo.all(query)
    {last, first, get_bus(bus_id)}
  end

  def get_bus(nil), do: nil
  def get_bus(:null), do: nil
  def get_bus(id) do
    query = from(b in InfoGather.BusModel,
                 where: b.id == ^id,
                 select: b.name)
    result = InfoGather.Repo.all(query)
    if Enum.empty? result do
      nil
    else
      hd result
    end
  end

  def ordered_parents do
    query = from(p in InfoParse.ParentModel,
                 order_by: [p.lastname, p.firstname],
                 select: p.id)
    InfoParse.Repo.all(query)
  end

  def get_parent(parent_id) do
    query = from(s in InfoParse.ParentModel,
                 where: s.id == ^parent_id,
                 select: {s.lastname, s.firstname})
    [result] = InfoParse.Repo.all(query)
    result
  end

  def get_parents(student_id) do
    query = from(sp in InfoParse.StudentParentModel,
                 where: sp.student_id == ^student_id,
                 join: p in InfoParse.ParentModel, on: sp.parent_id == p.id,
                 order_by: [p.lastname, p.firstname],
                 select: {p.lastname, p.firstname, p.email, p.phone, p.address_id, p.notes})
    InfoParse.Repo.all(query)
      |> Enum.chunk_by(fn({_, _, _, _, addr_id, _}) -> addr_id end)
      |> Enum.map(&add_address(&1))
  end

  defp add_address(parent_list) do
    {_last, _first, _email, _phone, addr_id, _notes} = hd parent_list
    address = get_address(addr_id)
    {parent_list, address}
  end

  def get_address(id) do
    query = from(a in InfoParse.AddressModel,
                 where: a.id == ^id,
                 select: {a.phone, a.address1, a.address2, a.city, a.state, a.zip})
    [result] = InfoParse.Repo.all(query)
    result
  end

end

