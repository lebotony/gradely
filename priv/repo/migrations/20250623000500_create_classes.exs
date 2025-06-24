defmodule Gradely.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      timestamps()
    end
  end
end
