defmodule GradelyWeb.Api.AdminView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.AdminView

  def render("index.json", %{admins: admins}) do
    %{data: render_many(admins, AdminView, "admin.json")}
  end

  def render("show.json", %{admin: admin}) do
    %{data: render_one(admin, AdminView, "admin.json")}
  end

  def render("admin.json", %{admin: admin}) do
    %{
      id: admin.id,
      user_id: admin.user_id
    }
  end
end
