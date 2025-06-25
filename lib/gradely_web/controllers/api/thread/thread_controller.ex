defmodule GradelyWeb.Api.ThreadController do
  use GradelyWeb, :controller

  alias Gradely.{Thread, Threads}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    threads = Threads.list_threads()
    render(conn, "index.json", threads: threads)
  end

  def show(conn, %{"id" => id}) do
    thread = Threads.get_thread!(id)
    render(conn, "show.json", thread: thread)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Thread{} = thread} <- Threads.create_thread(params) do
      conn
      |> put_status(:created)
      |> render("show.json", thread: thread)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    thread = Threads.get_thread!(id)

    with {:ok, %Thread{} = thread} <- Threads.update_thread(thread, params) do
      render(conn, "show.json", thread: thread)
    end
  end

  def delete(conn, %{"id" => id}) do
    thread = Threads.get_thread!(id)
    with {:ok, %Thread{}} <- Threads.delete_thread(thread) do
      send_resp(conn, :no_content, "")
    end
  end
end
