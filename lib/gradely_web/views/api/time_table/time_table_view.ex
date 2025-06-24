defmodule GradelyWeb.Api.TimeTableView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.TimeTableView

  def render("index.json", %{time_tables: time_tables}) do
    %{data: render_many(time_tables, TimeTableView, "time_table.json")}
  end

  def render("show.json", %{time_table: time_table}) do
    %{data: render_one(time_table, TimeTableView, "time_table.json")}
  end

  def render("time_table.json", %{time_table: time_table}) do
    %{
      id: time_table.id,
      class_id: time_table.class_id
    }
  end
end
