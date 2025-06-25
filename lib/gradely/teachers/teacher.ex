defmodule Gradely.Teacher do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{User, Class}

  @params [:dob, :blood_type, :religion, :user_id]

  schema "teachers" do
    field :dob, :date
    field :blood_type, :string
    field :religion, :string

    belongs_to :user, User
    many_to_many :classes, Class, join_through: "class_teachers"

    timestamps()
  end

  @doc false
  def changeset(teacher, attrs) do
    teacher
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
