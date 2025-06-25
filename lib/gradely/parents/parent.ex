defmodule Gradely.Parent do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{User, Student, School}

  @params [:user_id]

  schema "parents" do
    belongs_to :user, User
    has_many :students, Student

    many_to_many :schools, School, join_through: "school_parents"

    timestamps()
  end

  @doc false
  def changeset(parent, attrs) do
    parent
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
