defmodule Gradely.TeacherSchedules do
  import Ecto.Query, warn: false
  alias Gradely.Repo
  alias Gradely.TeacherSchedule

  def list_teacher_schedules do
    Repo.all(TeacherSchedule)
  end

  def get_teacher_schedule!(id), do: Repo.get!(TeacherSchedule, id)

  def create_teacher_schedule(attrs \\ %{}) do
    %TeacherSchedule{}
    |> TeacherSchedule.changeset(attrs)
    |> Repo.insert()
  end

  def update_teacher_schedule(%TeacherSchedule{} = schedule, attrs) do
    schedule
    |> TeacherSchedule.changeset(attrs)
    |> Repo.update()
  end

  def delete_teacher_schedule(%TeacherSchedule{} = schedule) do
    Repo.delete(schedule)
  end

  def change_teacher_schedule(%TeacherSchedule{} = schedule, attrs \\ %{}) do
    TeacherSchedule.changeset(schedule, attrs)
  end
end
