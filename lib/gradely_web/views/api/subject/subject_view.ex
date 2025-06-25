defmodule GradelyWeb.Api.SubjectView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.SubjectView

  def render("index.json", %{subjects: subjects}) do
    %{data: render_many(subjects, SubjectView, "subject.json")}
  end

  def render("show.json", %{subject: subject}) do
    %{data: render_one(subject, SubjectView, "subject.json")}
  end

  def render("subject.json", %{subject: subject}) do
    %{
      id: subject.id,
      name: subject.name,
      class_id: subject.class_id
    }
  end
end
