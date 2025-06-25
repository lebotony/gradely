defmodule Gradely.TeacherSchedules.TeacherSchedulesClass do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gradely.{Class, TeacherSchedule}

  @params [:teacher_schedule_id, :class_id]

  schema "teacher_schedules_class" do
    belongs_to :teacher_schedule, TeacherSchedule
    belongs_to :class, Class

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
