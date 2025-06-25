defmodule GradelyWeb.Api.StudentController do
  use GradelyWeb, :controller

  alias Gradely.{Student, Students}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    students = Students.list_students()
    render(conn, "index.json", students: students)
  end

  def show(conn, %{"id" => id}) do
    student = Students.get_student!(id)
    render(conn, "show.json", student: student)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Student{} = student} <- Students.create_student(params) do
      conn
      |> put_status(:created)
      |> render("show.json", student: student)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    student = Students.get_student!(id)

    with {:ok, %Student{} = student} <- Students.update_student(student, params) do
      render(conn, "show.json", student: student)
    end
  end

  def delete(conn, %{"id" => id}) do
    student = Students.get_student!(id)
    with {:ok, %Student{}} <- Students.delete_student(student) do
      send_resp(conn, :no_content, "")
    end
  end
end
