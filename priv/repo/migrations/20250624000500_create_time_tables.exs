defmodule Gradely.Repo.Migrations.CreateTimeTables do
  use Ecto.Migration

  def change do
    create table(:time_tables) do
      add :class_id, references(:classes)

      timestamps()
    end

    create index(:time_tables, [:class_id])
  end
end
