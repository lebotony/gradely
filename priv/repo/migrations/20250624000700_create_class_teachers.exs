defmodule Gradely.Repo.Migrations.CreateClassTeachers do
  use Ecto.Migration

  def change do
    create table(:class_teachers) do
      add :class_id, references(:classes)
      add :teacher_id, references(:teachers)

      timestamps()
    end

    create index(:class_teachers, [:class_id])
    create index(:class_teachers, [:teacher_id])
  end
end
