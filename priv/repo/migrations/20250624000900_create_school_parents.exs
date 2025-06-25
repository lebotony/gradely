defmodule Gradely.Repo.Migrations.CreateSchoolParents do
  use Ecto.Migration

  def change do
    create table(:school_parents) do
      add :school_id, references(:schools)
      add :parent_id, references(:parents)

      timestamps()
    end

    create index(:school_parents, [:school_id])
    create index(:school_parents, [:parent_id])
  end
end
