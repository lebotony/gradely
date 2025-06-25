defmodule Gradely.Exam do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.Class

  @params [:exam_name, :writing_date, :type]

  schema "exams" do
    field :exam_name, :string
    field :writing_date, :date
    field :type, :string

    many_to_many :classes, Class, join_through: "class_exams"

    timestamps()
  end

  @doc false
  def changeset(exam, attrs) do
    exam
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
