defmodule GradelyWeb.Api.ClassController do
  use GradelyWeb, :controller

  alias Gradely.{Class, Classes}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    classes = Classes.list_classes()
    render(conn, "index.json", classes: classes)
  end

  def show(conn, %{"id" => id}) do
    class = Classes.get_class!(id)
    render(conn, "show.json", class: class)
  end

  def create(conn, %{"class" => params}) do
    with {:ok, %Class{} = class} <- Classes.create_class(params) do
      conn
      |> put_status(:created)
      |> render("show.json", class: class)
    end
  end

  def update(conn, %{"id" => id, "class" => params}) do
    class = Classes.get_class!(id)

    with {:ok, %Class{} = class} <- Classes.update_class(class, params) do
      render(conn, "show.json", class: class)
    end
  end

  def delete(conn, %{"id" => id}) do
    class = Classes.get_class!(id)
    with {:ok, %Class{}} <- Classes.delete_class(class) do
      send_resp(conn, :no_content, "")
    end
  end
end
