defmodule GradelyWeb.Api.ExamView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.ExamView

  def render("index.json", %{exams: exams}) do
    %{data: render_many(exams, ExamView, "exam.json")}
  end

  def render("show.json", %{exam: exam}) do
    %{data: render_one(exam, ExamView, "exam.json")}
  end

  def render("exam.json", %{exam: exam}) do
    %{
      id: exam.id,
      exam_name: exam.exam_name,
      writing_date: exam.writing_date,
      type: exam.type
    }
  end
end
