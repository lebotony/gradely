defmodule Gradely.Exams do
  import Ecto.Query, warn: false
  alias Gradely.{Repo, Exam}

  def list_exams do
    Repo.all(Exam)
  end

  def get_exam!(id), do: Repo.get!(Exam, id)

  def create_exam(attrs \\ %{}) do
    %Exam{}
    |> Exam.changeset(attrs)
    |> Repo.insert()
  end

  def update_exam(%Exam{} = exam, attrs) do
    exam
    |> Exam.changeset(attrs)
    |> Repo.update()
  end

  def delete_exam(%Exam{} = exam) do
    Repo.delete(exam)
  end

  def change_exam(%Exam{} = exam, attrs \\ %{}) do
    Exam.changeset(exam, attrs)
  end
end
