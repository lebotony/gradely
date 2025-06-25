defmodule GradelyWeb.Api.AdminController do
  use GradelyWeb, :controller

  alias Gradely.{Admin, Admins}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    admins = Admins.list_admins()
    render(conn, "index.json", admins: admins)
  end

  def show(conn, %{"id" => id}) do
    admin = Admins.get_admin!(id)
    render(conn, "show.json", admin: admin)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Admin{} = admin} <- Admins.create_admin(params) do
      conn
      |> put_status(:created)
      |> render("show.json", admin: admin)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    admin = Admins.get_admin!(id)

    with {:ok, %Admin{} = admin} <- Admins.update_admin(admin, params) do
      render(conn, "show.json", admin: admin)
    end
  end

  def delete(conn, %{"id" => id}) do
    admin = Admins.get_admin!(id)
    with {:ok, %Admin{}} <- Admins.delete_admin(admin) do
      send_resp(conn, :no_content, "")
    end
  end
end
