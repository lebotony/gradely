defmodule Gradely.Thread do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gradely.{User, Threads.ThreadUser, Message}

  @params []

  schema "threads" do
    many_to_many :users, User, join_through: "thread_users"
    has_many :thread_users, ThreadUser
    has_many :messages, Message

    timestamps()
  end

  @doc false
  def changeset(thread, attrs) do
    thread
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
