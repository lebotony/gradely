defmodule Gradely.Schools do
  import Ecto.Query, warn: false
  alias Gradely.{Repo, School}

  def list_schools do
    Repo.all(School)
  end

  def get_school!(id), do: Repo.get!(School, id)

  def create_school(attrs \\ %{}) do
    %School{}
    |> School.changeset(attrs)
    |> Repo.insert()
  end

  def update_school(%School{} = school, attrs) do
    school
    |> School.changeset(attrs)
    |> Repo.update()
  end

  def delete_school(%School{} = school) do
    Repo.delete(school)
  end

  def change_school(%School{} = school, attrs \\ %{}) do
    School.changeset(school, attrs)
  end
end
