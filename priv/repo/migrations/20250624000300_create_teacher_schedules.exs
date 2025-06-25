defmodule Gradely.Repo.Migrations.CreateTeacherSchedules do
  use Ecto.Migration

  def change do
    create table(:teacher_schedules) do
      timestamps()
    end
  end
end
