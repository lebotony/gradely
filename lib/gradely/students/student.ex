defmodule Gradely.Student do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{User, Parent, Class}

  @params [:user_id, :parent_id, :class_id, :admission_number, :dob, :gender]

  schema "students" do
    field :dob, :date
    field :gender, :string

    belongs_to :user, User
    belongs_to :parent, Parent
    belongs_to :class, Class

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
