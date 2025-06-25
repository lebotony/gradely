defmodule GradelyWeb.Api.SchoolEventController do
  use GradelyWeb, :controller

  alias Gradely.{SchoolEvent, SchoolEvents}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    events = SchoolEvents.list_school_events()
    render(conn, "index.json", school_events: events)
  end

  def show(conn, %{"id" => id}) do
    event = SchoolEvents.get_school_event!(id)
    render(conn, "show.json", school_event: event)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %SchoolEvent{} = event} <- SchoolEvents.create_school_event(params) do
      conn
      |> put_status(:created)
      |> render("show.json", school_event: event)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    event = SchoolEvents.get_school_event!(id)

    with {:ok, %SchoolEvent{} = event} <- SchoolEvents.update_school_event(event, params) do
      render(conn, "show.json", school_event: event)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = SchoolEvents.get_school_event!(id)
    with {:ok, %SchoolEvent{}} <- SchoolEvents.delete_school_event(event) do
      send_resp(conn, :no_content, "")
    end
  end
end
