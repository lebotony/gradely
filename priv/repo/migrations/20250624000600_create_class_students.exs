defmodule Gradely.Repo.Migrations.CreateClassStudents do
  use Ecto.Migration

  def change do
    create table(:class_students) do
      add :class_id, references(:classes)
      add :student_id, references(:students)

      timestamps()
    end

    create index(:class_students, [:class_id])
    create index(:class_students, [:student_id])
  end
end
