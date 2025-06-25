defmodule Gradely.Classes do
  import Ecto.Query, warn: false
  alias Gradely.{Repo, Class}

  def list_classes do
    Repo.all(Class)
  end

  def get_class!(id), do: Repo.get!(Class, id)

  def create_class(attrs \\ %{}) do
    %Class{}
    |> Class.changeset(attrs)
    |> Repo.insert()
  end

  def update_class(%Class{} = class, attrs) do
    class
    |> Class.changeset(attrs)
    |> Repo.update()
  end

  def delete_class(%Class{} = class) do
    Repo.delete(class)
  end

  def change_class(%Class{} = class, attrs \\ %{}) do
    Class.changeset(class, attrs)
  end
end
