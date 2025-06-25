defmodule Gradely.Classes.ClassTeacher do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{Class, Teacher}

  @params [:class_id, :teacher_id]

  schema "class_teachers" do
    belongs_to :class, Class
    belongs_to :teacher, Teacher

    timestamps()
  end

  @doc false
  def changeset(class_teacher, attrs) do
    class_teacher
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
