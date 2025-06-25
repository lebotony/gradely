defmodule Gradely.SchoolEvents do
  import Ecto.Query, warn: false
  alias Gradely.Repo
  alias Gradely.SchoolEvent

  def list_school_events do
    Repo.all(SchoolEvent)
  end

  def get_school_event!(id), do: Repo.get!(SchoolEvent, id)

  def create_school_event(attrs \\ %{}) do
    %SchoolEvent{}
    |> SchoolEvent.changeset(attrs)
    |> Repo.insert()
  end

  def update_school_event(%SchoolEvent{} = event, attrs) do
    event
    |> SchoolEvent.changeset(attrs)
    |> Repo.update()
  end

  def delete_school_event(%SchoolEvent{} = event) do
    Repo.delete(event)
  end

  def change_school_event(%SchoolEvent{} = event, attrs \\ %{}) do
    SchoolEvent.changeset(event, attrs)
  end
end
