defmodule Gradely.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{User, Thread}

  @params [:content, :seen, :author_id, :recipient_id, :thread_id]

  schema "messages" do
    field :content, :string
    field :seen, :boolean, default: false

    belongs_to :author, User
    belongs_to :recipient, User
    belongs_to :thread, Thread

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
