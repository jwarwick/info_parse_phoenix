defmodule InfoParse.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url(do_url(System.get_env("DATABASE_URL")))
  end

  defp do_url(nil) do
    user = case System.get_env("USER") do
      nil -> "postgres"
      x -> x
    end
    "ecto://#{user}@localhost/infoparse"
  end

  # Sample DATABASE_URL from Heroku
  # postgres://user3123:passkja83kd8@ec2-117-21-174-214.compute-1.amazonaws.com:6212/db982398
  defp do_url(x), do: String.replace(x, ~r{^postgres}, "ecto")

  def priv do
    app_dir(:info_parse_phoenix, "priv/repo")
  end
end

defmodule InfoParse.StudentModel do
  use Ecto.Model

  schema "student" do
    field :firstname, :string    
    field :lastname, :string    
    field :bus_id, :integer
    field :classroom_id, :integer
  end
end

defmodule InfoParse.ParentModel do
  use Ecto.Model

  schema "parent" do
    field :firstname, :string    
    field :lastname, :string    
    field :email, :string    
    field :phone, :string    
    field :address_id, :integer
    field :notes, :string
  end
end

defmodule InfoParse.AddressModel do
  use Ecto.Model

  schema "address" do
    field :phone, :string    
    field :address1, :string    
    field :address2, :string    
    field :city, :string    
    field :state, :string    
    field :zip, :string
  end
end

defmodule InfoParse.StudentParentModel do
  use Ecto.Model

  schema "student_parent" do
    field :student_id, :integer
    field :parent_id, :integer
  end
end

