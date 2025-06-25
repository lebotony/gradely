defmodule GradelyWeb.Api.TeacherScheduleController do
  use GradelyWeb, :controller

  alias Gradely.{TeacherSchedule, TeacherSchedules}

  action_fallback GradelyWeb.FallbackController

  def index(conn, _params) do
    schedules = TeacherSchedules.list_teacher_schedules()
    render(conn, "index.json", teacher_schedules: schedules)
  end

  def show(conn, %{"id" => id}) do
    schedule = TeacherSchedules.get_teacher_schedule!(id)
    render(conn, "show.json", teacher_schedule: schedule)
  end

  def create(conn, %{"params" => params}) do
    with {:ok, %TeacherSchedule{} = schedule} <- TeacherSchedules.create_teacher_schedule(params) do
      conn
      |> put_status(:created)
      |> render("show.json", teacher_schedule: schedule)
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    schedule = TeacherSchedules.get_teacher_schedule!(id)

    with {:ok, %TeacherSchedule{} = schedule} <- TeacherSchedules.update_teacher_schedule(schedule, params) do
      render(conn, "show.json", teacher_schedule: schedule)
    end
  end

  def delete(conn, %{"id" => id}) do
    schedule = TeacherSchedules.get_teacher_schedule!(id)
    with {:ok, %TeacherSchedule{}} <- TeacherSchedules.delete_teacher_schedule(schedule) do
      send_resp(conn, :no_content, "")
    end
  end
end
