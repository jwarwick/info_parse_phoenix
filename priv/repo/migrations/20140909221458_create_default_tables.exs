defmodule InfoParse.Repo.Migrations.CreateDefaultTables do
  use Ecto.Migration

  def up do
    [
      "CREATE TABLE IF NOT EXISTS student (id serial PRIMARY KEY, firstname text, lastname text, bus_id integer, classroom_id integer)",
      "CREATE TABLE IF NOT EXISTS address (id serial PRIMARY KEY, phone text, address1 text, address2 text, city text, state text, zip text)",
      "CREATE TABLE IF NOT EXISTS parent (id serial PRIMARY KEY, firstname text, lastname text, email text, phone text, address_id integer, notes text)",
      "CREATE TABLE IF NOT EXISTS student_parent (id serial PRIMARY KEY, student_id integer, parent_id integer)"
    ]
  end

  def down do
    [
      "DROP TABLE student",
      "DROP TABLE address",
      "DROP TABLE parent",
      "DROP TABLE student_parent"
    ]
  end
end
