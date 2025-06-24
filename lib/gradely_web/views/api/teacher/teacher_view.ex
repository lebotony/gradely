defmodule GradelyWeb.Api.TeacherView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.TeacherView

  def render("index.json", %{teachers: teachers}) do
    %{data: render_many(teachers, TeacherView, "teacher.json")}
  end

  def render("show.json", %{teacher: teacher}) do
    %{data: render_one(teacher, TeacherView, "teacher.json")}
  end

  def render("teacher.json", %{teacher: teacher}) do
    %{
      id: teacher.id,
      dob: teacher.dob,
      blood_type: teacher.blood_type,
      religion: teacher.religion,
      user_id: teacher.user_id
    }
  end
end
