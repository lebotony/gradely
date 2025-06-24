defmodule GradelyWeb.Api.SchoolController do
  use GradelyWeb, :controller

  alias Gradely.{School, Schools}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    schools = Schools.list_schools()
    render(conn, "index.json", schools: schools)
  end

  def show(conn, %{"id" => id}) do
    school = Schools.get_school!(id)
    render(conn, "show.json", school: school)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %School{} = school} <- Schools.create_school(params) do
      conn
      |> put_status(:created)
      |> render("show.json", school: school)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    school = Schools.get_school!(id)

    with {:ok, %School{} = school} <- Schools.update_school(school, params) do
      render(conn, "show.json", school: school)
    end
  end

  def delete(conn, %{"id" => id}) do
    school = Schools.get_school!(id)
    with {:ok, %School{}} <- Schools.delete_school(school) do
      send_resp(conn, :no_content, "")
    end
  end
end
