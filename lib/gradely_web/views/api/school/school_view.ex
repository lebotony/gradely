defmodule GradelyWeb.Api.SchoolView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.SchoolView

  def render("index.json", %{schools: schools}) do
    %{data: render_many(schools, SchoolView, "school.json")}
  end

  def render("show.json", %{school: school}) do
    %{data: render_one(school, SchoolView, "school.json")}
  end

  def render("school.json", %{school: school}) do
    %{
      id: school.id,
      name: school.name,
      location: school.location,
      meta_data: school.meta_data
    }
  end
end
