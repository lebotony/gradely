defmodule Gradely.TimeTable do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{Class}

  @params [:class_id]

  schema "time_tables" do
    belongs_to :class, Class

    timestamps()
  end

  @doc false
  def changeset(time_table, attrs) do
    time_table
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
