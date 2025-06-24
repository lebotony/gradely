defmodule Gradely.SchoolEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @params [:name]

  schema "school_events" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
