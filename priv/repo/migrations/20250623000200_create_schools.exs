defmodule Gradely.Repo.Migrations.CreateSchools do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :name, :string
      add :location, :map
      add :meta_data, :map

      timestamps()
    end
  end
end
