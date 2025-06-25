defmodule Gradely.TeacherSchedule do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gradely.Class

  @params []

  schema "teacher_schedules" do
    many_to_many :classes, Class, join_through: "teacher_schedules_class"

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
