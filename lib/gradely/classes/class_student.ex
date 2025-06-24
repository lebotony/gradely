defmodule Gradely.Classes.ClassStudent do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{Class, Student}

  @params [:class_id, :student_id]

  schema "class_students" do
    belongs_to :class, Class
    belongs_to :student, Student

    timestamps()
  end

  @doc false
  def changeset(class_student, attrs) do
    class_student
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
