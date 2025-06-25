defmodule Gradely.Teachers do
  import Ecto.Query, warn: false
  alias Gradely.{Repo, Teacher}

  def list_teachers do
    Repo.all(Teacher)
  end

  def get_teacher!(id), do: Repo.get!(Teacher, id)

  def create_teacher(attrs \\ %{}) do
    %Teacher{}
    |> Teacher.changeset(attrs)
    |> Repo.insert()
  end

  def update_teacher(%Teacher{} = teacher, attrs) do
    teacher
    |> Teacher.changeset(attrs)
    |> Repo.update()
  end

  def delete_teacher(%Teacher{} = teacher) do
    Repo.delete(teacher)
  end

  def change_teacher(%Teacher{} = teacher, attrs \\ %{}) do
    Teacher.changeset(teacher, attrs)
  end
end
