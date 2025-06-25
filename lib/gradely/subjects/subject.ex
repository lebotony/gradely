defmodule Gradely.Subject do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{Result, Class}

  @params [:name, :class_id]

  schema "subjects" do
    field :name, :string

    belongs_to :class, Class
    belongs_to :result, Result

    timestamps()
  end

  @doc false
  def changeset(subject, attrs) do
    subject
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
