defmodule GradelyWeb.Api.SubjectController do
  use GradelyWeb, :controller

  alias Gradely.{Subject, Subjects}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    subjects = Subjects.list_subjects()
    render(conn, "index.json", subjects: subjects)
  end

  def show(conn, %{"id" => id}) do
    subject = Subjects.get_subject!(id)
    render(conn, "show.json", subject: subject)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Subject{} = subject} <- Subjects.create_subject(params) do
      conn
      |> put_status(:created)
      |> render("show.json", subject: subject)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    subject = Subjects.get_subject!(id)

    with {:ok, %Subject{} = subject} <- Subjects.update_subject(subject, params) do
      render(conn, "show.json", subject: subject)
    end
  end

  def delete(conn, %{"id" => id}) do
    subject = Subjects.get_subject!(id)
    with {:ok, %Subject{}} <- Subjects.delete_subject(subject) do
      send_resp(conn, :no_content, "")
    end
  end
end
