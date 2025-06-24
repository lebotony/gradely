defmodule GradelyWeb.Api.TeacherController do
  use GradelyWeb, :controller

  alias Gradely.{Teacher, Teachers}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    teachers = Teachers.list_teachers()
    render(conn, "index.json", teachers: teachers)
  end

  def show(conn, %{"id" => id}) do
    teacher = Teachers.get_teacher!(id)
    render(conn, "show.json", teacher: teacher)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Teacher{} = teacher} <- Teachers.create_teacher(params) do
      conn
      |> put_status(:created)
      |> render("show.json", teacher: teacher)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    teacher = Teachers.get_teacher!(id)

    with {:ok, %Teacher{} = teacher} <- Teachers.update_teacher(teacher, params) do
      render(conn, "show.json", teacher: teacher)
    end
  end

  def delete(conn, %{"id" => id}) do
    teacher = Teachers.get_teacher!(id)
    with {:ok, %Teacher{}} <- Teachers.delete_teacher(teacher) do
      send_resp(conn, :no_content, "")
    end
  end
end
