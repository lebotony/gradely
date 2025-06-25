defmodule GradelyWeb.Api.MessageController do
  use GradelyWeb, :controller

  alias Gradely.{Message, Messages}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    messages = Messages.list_messages()
    render(conn, "index.json", messages: messages)
  end

  def show(conn, %{"id" => id}) do
    message = Messages.get_message!(id)
    render(conn, "show.json", message: message)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Message{} = message} <- Messages.create_message(params) do
      conn
      |> put_status(:created)
      |> render("show.json", message: message)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    message = Messages.get_message!(id)

    with {:ok, %Message{} = message} <- Messages.update_message(message, params) do
      render(conn, "show.json", message: message)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = Messages.get_message!(id)
    with {:ok, %Message{}} <- Messages.delete_message(message) do
      send_resp(conn, :no_content, "")
    end
  end
end
