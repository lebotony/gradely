defmodule GradelyWeb.Api.TeacherScheduleView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.TeacherScheduleView

  def render("index.json", %{teacher_schedules: schedules}) do
    %{data: render_many(schedules, TeacherScheduleView, "teacher_schedule.json")}
  end

  def render("show.json", %{teacher_schedule: schedule}) do
    %{data: render_one(schedule, TeacherScheduleView, "teacher_schedule.json")}
  end

  def render("teacher_schedule.json", %{teacher_schedule: schedule}) do
    %{
      id: schedule.id
    }
  end
end
