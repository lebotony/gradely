defmodule Gradely.Repo.Migrations.CreateSubjects do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :name, :string
      add :class_id, references(:classes)

      timestamps()
    end
    create index(:subjects, [:class_id])
  end
end
