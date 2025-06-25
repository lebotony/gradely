defmodule GradelyWeb.Api.TimeTableController do
  use GradelyWeb, :controller

  alias Gradely.{TimeTable, TimeTables}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    time_tables = TimeTables.list_time_tables()
    render(conn, "index.json", time_tables: time_tables)
  end

  def show(conn, %{"id" => id}) do
    time_table = TimeTables.get_time_table!(id)
    render(conn, "show.json", time_table: time_table)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %TimeTable{} = time_table} <- TimeTables.create_time_table(params) do
      conn
      |> put_status(:created)
      |> render("show.json", time_table: time_table)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    time_table = TimeTables.get_time_table!(id)

    with {:ok, %TimeTable{} = time_table} <- TimeTables.update_time_table(time_table, params) do
      render(conn, "show.json", time_table: time_table)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_table = TimeTables.get_time_table!(id)
    with {:ok, %TimeTable{}} <- TimeTables.delete_time_table(time_table) do
      send_resp(conn, :no_content, "")
    end
  end
end
