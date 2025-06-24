defmodule Gradely.Repo.Migrations.AddTeacherSchedulesClassTable do
  use Ecto.Migration

  def change do
    create table(:teacher_schedules_class) do
      add :teacher_schedule_id, references(:teacher_schedules)
      add :class_id, references(:classes)

      timestamps()
    end

    create index(:teacher_schedules_class, [:teacher_schedule_id, :class_id])
  end
end
