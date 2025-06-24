defmodule Gradely.Result do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.Subject

  @params []

  schema "results" do
    has_many :subjects, Subject

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
