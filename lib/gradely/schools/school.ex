defmodule Gradely.School do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{User, Parent}

  @params [:name, :location, :meta_data]

  schema "schools" do
    field :name, :string
    field :location, :map
    field :meta_data, :map

    has_many :users, User
    many_to_many :parents, Parent, join_through: "school_parents"

    timestamps()
  end

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
