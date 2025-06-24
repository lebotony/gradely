defmodule Gradely.Students do
  import Ecto.Query, warn: false
  alias Gradely.Repo
  alias Gradely.Student

  def list_students do
    Repo.all(Student)
  end

  def get_student!(id), do: Repo.get!(Student, id)

  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  def update_student(%Student{} = student, attrs) do
    student
    |> Student.changeset(attrs)
    |> Repo.update()
  end

  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end

  def change_student(%Student{} = student, attrs \\ %{}) do
    Student.changeset(student, attrs)
  end
end
