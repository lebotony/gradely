defmodule Gradely.Classes.ClassExam do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{Class, Exam}

  @params [:class_id, :exam_id]

  schema "class_exams" do
    belongs_to :class, Class
    belongs_to :exam, Exam

    timestamps()
  end

  @doc false
  def changeset(class_exam, attrs) do
    class_exam
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
