defmodule GradelyWeb.Api.ResultController do
  use GradelyWeb, :controller

  alias Gradely.{Result, Results}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    results = Results.list_results()
    render(conn, "index.json", results: results)
  end

  def show(conn, %{"id" => id}) do
    result = Results.get_result!(id)
    render(conn, "show.json", result: result)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %Result{} = result} <- Results.create_result(params) do
      conn
      |> put_status(:created)
      |> render("show.json", result: result)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    result = Results.get_result!(id)

    with {:ok, %Result{} = result} <- Results.update_result(result, params) do
      render(conn, "show.json", result: result)
    end
  end

  def delete(conn, %{"id" => id}) do
    result = Results.get_result!(id)
    with {:ok, %Result{}} <- Results.delete_result(result) do
      send_resp(conn, :no_content, "")
    end
  end
end
