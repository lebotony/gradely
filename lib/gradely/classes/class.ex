defmodule Gradely.Class do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{Student, TimeTable, Teacher, Exam}

  @params []

  schema "classes" do
    has_one :time_table, TimeTable
    many_to_many :teacher_schedules, TeacherSchedule, join_through: "teacher_schedules_class"
    many_to_many :teachers, Teacher, join_through: "class_teachers"
    many_to_many :students, Student, join_through: "class_students"
    many_to_many :exams, Exam, join_through: "class_exams"

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
