defmodule GradelyWeb.Api.StudentView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.StudentView

  def render("index.json", %{students: students}) do
    %{data: render_many(students, StudentView, "student.json")}
  end

  def render("show.json", %{student: student}) do
    %{data: render_one(student, StudentView, "student.json")}
  end

  def render("student.json", %{student: student}) do
    %{
      id: student.id,
      user_id: student.user_id,
      parent_id: student.parent_id,
      class_id: student.class_id,
      admission_number: student.admission_number,
      dob: student.dob,
      gender: student.gender,
      inserted_at: student.inserted_at,
      updated_at: student.updated_at
    }
  end
end
