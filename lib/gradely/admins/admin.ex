defmodule Gradely.Admin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.User

  @params [:user_id]

  schema "admins" do
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
