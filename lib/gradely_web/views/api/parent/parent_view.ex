defmodule GradelyWeb.Api.ParentView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.ParentView

  def render("index.json", %{parents: parents}) do
    %{data: render_many(parents, ParentView, "parent.json")}
  end

  def render("show.json", %{parent: parent}) do
    %{data: render_one(parent, ParentView, "parent.json")}
  end

  def render("parent.json", %{parent: parent}) do
    %{
      id: parent.id,
      user_id: parent.user_id
    }
  end
end
