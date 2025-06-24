defmodule Gradely.Repo.Migrations.CreateClassExams do
  use Ecto.Migration

  def change do
    create table(:class_exams) do
      add :class_id, references(:classes)
      add :exam_id, references(:exams)

      timestamps()
    end

    create index(:class_exams, [:class_id])
    create index(:class_exams, [:exam_id])
  end
end
