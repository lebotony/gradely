defmodule Gradely.Schools.SchoolParent do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{Parent, School}

  @params [:parent_id, :school_id]

  schema "school_parents" do
    belongs_to :parent, Parent
    belongs_to :school, School

    timestamps()
  end

  @doc false
  def changeset(school_parent, attrs) do
    school_parent
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
