defmodule Gradely.Threads.ThreadUser do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{Thread, User}

  @params [:thread_id, :user_id]

  schema "thread_users" do
    belongs_to :thread, Thread
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(thread_user, attrs) do
    thread_user
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
