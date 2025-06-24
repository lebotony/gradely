defmodule GradelyWeb.Api.SchoolEventView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.SchoolEventView

  def render("index.json", %{school_events: events}) do
    %{data: render_many(events, SchoolEventView, "school_event.json")}
  end

  def render("show.json", %{school_event: event}) do
    %{data: render_one(event, SchoolEventView, "school_event.json")}
  end

  def render("school_event.json", %{school_event: event}) do
    %{
      id: event.id,
      name: event.name
    }
  end
end
