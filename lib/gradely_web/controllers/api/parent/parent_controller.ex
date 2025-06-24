defmodule GradelyWeb.Api.ParentController do
  use GradelyWeb, :controller

  alias Gradely.{Parent, Parents}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    parents = Parents.list_parents()
    render(conn, "index.json", parents: parents)
  end

  def show(conn, %{"id" => id}) do
    parent = Parents.get_parent!(id)
    render(conn, "show.json", parent: parent)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Parent{} = parent} <- Parents.create_parent(params) do
      conn
      |> put_status(:created)
      |> render("show.json", parent: parent)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    parent = Parents.get_parent!(id)

    with {:ok, %Parent{} = parent} <- Parents.update_parent(parent, params) do
      render(conn, "show.json", parent: parent)
    end
  end

  def delete(conn, %{"id" => id}) do
    parent = Parents.get_parent!(id)
    with {:ok, %Parent{}} <- Parents.delete_parent(parent) do
      send_resp(conn, :no_content, "")
    end
  end
end
