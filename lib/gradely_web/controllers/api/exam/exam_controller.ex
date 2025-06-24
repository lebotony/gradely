defmodule GradelyWeb.Api.ExamController do
  use GradelyWeb, :controller

  alias Gradely.{Exam, Exams}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    exams = Exams.list_exams()
    render(conn, "index.json", exams: exams)
  end

  def show(conn, %{"id" => id}) do
    exam = Exams.get_exam!(id)
    render(conn, "show.json", exam: exam)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Exam{} = exam} <- Exams.create_exam(params) do
      conn
      |> put_status(:created)
      |> render("show.json", exam: exam)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    exam = Exams.get_exam!(id)

    with {:ok, %Exam{} = exam} <- Exams.update_exam(exam, params) do
      render(conn, "show.json", exam: exam)
    end
  end

  def delete(conn, %{"id" => id}) do
    exam = Exams.get_exam!(id)
    with {:ok, %Exam{}} <- Exams.delete_exam(exam) do
      send_resp(conn, :no_content, "")
    end
  end
end
