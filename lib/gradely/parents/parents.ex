defmodule Gradely.Parents do
  import Ecto.Query, warn: false
  alias Gradely.{Repo, Parent}

  def list_parents do
    Repo.all(Parent)
  end

  def get_parent!(id), do: Repo.get!(Parent, id)

  def create_parent(attrs \\ %{}) do
    %Parent{}
    |> Parent.changeset(attrs)
    |> Repo.insert()
  end

  def update_parent(%Parent{} = parent, attrs) do
    parent
    |> Parent.changeset(attrs)
    |> Repo.update()
  end

  def delete_parent(%Parent{} = parent) do
    Repo.delete(parent)
  end

  def change_parent(%Parent{} = parent, attrs \\ %{}) do
    Parent.changeset(parent, attrs)
  end
end
