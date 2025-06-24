defmodule GradelyWeb.Api.ThreadView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.ThreadView

  def render("index.json", %{threads: threads}) do
    %{data: render_many(threads, ThreadView, "thread.json")}
  end

  def render("show.json", %{thread: thread}) do
    %{data: render_one(thread, ThreadView, "thread.json")}
  end

  def render("thread.json", %{thread: thread}) do
    %{
      id: thread.id
    }
  end
end
