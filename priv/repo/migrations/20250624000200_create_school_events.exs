defmodule Gradely.Repo.Migrations.CreateSchoolEvents do
  use Ecto.Migration

  def change do
    create table(:school_events) do
      add :name, :string
      add :description, :string
      add :date, :date
      add :school_id, references(:schools)

      timestamps()
    end

    create index(:school_events, [:school_id])
  end
end
